terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "hifeyinc-cluster"
    key    = "iac/state/terraform.tfstate"
    region = "us-east-1"
  }

  required_version = "~> 1.7"
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}


module "ec2" {
  source           = "./ec2"
  prefix           = var.prefix
  instance_type    = var.instance_type
  keypair_content  = var.keypair_content
  volume_size      = var.volume_size
  volume_type      = var.volume_type
  private_key_path = var.private_key_path
}