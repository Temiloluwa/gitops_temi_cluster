terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "temi-gitops-cluster"
    key    = "swarm-cluster/iac/state/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "ec2" {
  source             = "./ec2"
  prefix             = var.prefix
  instance_type      = var.instance_type
  volume_size        = var.volume_size
  volume_type        = var.volume_type
  key_pair_file_path = var.key_pair_file_path
  key_pair_name      = var.key_pair_name
}