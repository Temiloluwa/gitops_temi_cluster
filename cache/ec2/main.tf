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

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.3.20240219.0-kernel-6.1-arm64"] 
  }

  filter {
  name   = "virtualization-type"
  values = ["hvm"]
  }
}

locals {
  default_tags = {
    project  = "temmie-cluster"
    user     = "tobi"
    validity = "100000"
  }
  subnet_id = element(tolist(data.aws_subnets.default.ids), 0)
}

resource "aws_instance" "cluster" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = local.subnet_id
  tags          = merge(local.default_tags, { Name = "${var.prefix}-cluster"})

  key_name = var.key_pair_name
  
  ebs_block_device {
    device_name = "/dev/xvda" 
    volume_size = var.volume_size
    volume_type = var.volume_type
    delete_on_termination = true
    tags = merge(local.default_tags, { Name = "${var.prefix}ebs" })
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
   user        = "ec2-user"
   private_key =  file(var.key_pair_file_path)
   timeout     = "1m"
 }
}