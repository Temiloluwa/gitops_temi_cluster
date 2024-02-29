data "aws_vpc" "default" {
  filter {
    name   = "isDefault"
    values = ["true"]
  }
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

locals {
  default_tags = {
    project  = "temmie-cluster"
    user     = "tobi"
    validity = "100000"
  }

  subnet_id = element(tolist(data.aws_subnets.default.ids), 0)
}


resource "aws_key_pair" "this" {
  key_name   = "clusterkey"
  public_key = file(var.keypair_content)
}


resource "aws_instance" "cluster" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = local.subnet_id
  tags = merge(local.default_tags, {
    Name = "${var.prefix}-cluster"
  })

  key_name = aws_key_pair.this.key_name
  
  ebs_block_device {
    device_name = "/dev/xvda" # got a lots of errors in finding the right name
    volume_size = var.volume_size
    volume_type = var.volume_type
    delete_on_termination = true
    tags = merge(local.default_tags, {
      Name = "${var.prefix}ebs"
    })
  }

  provisioner "file" {
    source      = "${path.module}/configure-cluster.sh"
    destination = "/tmp/configure-cluster.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "bash /tmp/configure-cluster.sh"
    ]
  }
 
 connection {
   type        = "ssh"
   host        = self.public_ip
   user        = "ubuntu"
   private_key = file(var.private_key_path)
   timeout     = "1m"
 }

}