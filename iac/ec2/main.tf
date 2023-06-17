locals {
  default_tags = {
    project  = "9ja-highlights"
    user     = "tobi"
    validity = "1000"
  }
}

data "aws_vpc" "default" {
  filter {
    name   = "isDefault"
    values = ["true"]
  }
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
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


resource "aws_key_pair" "this" {
  key_name   = "cluster-key"
  public_key = file(var.keypair_content)
}


resource "aws_instance" "cluster" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = data.aws_subnet_ids.default
  tags = merge(local.default_tags, {
    Name = "${var.prefix}-cluster"
  })

  key_name = aws_key_pair.this.key_name

  ebs_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
    tags = merge(local.default_tags, {
      Name = "${var.prefix}-ebs"
    })
  }

  #user_data = ""

}