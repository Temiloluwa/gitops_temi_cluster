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
  volume_size      = var.volume_size
  volume_type      = var.volume_type
  key_pair_content = var.key_pair_content
  key_pair_name    = var.key_pair_name
}