terraform {
  cloud {
    organization = "hifeyinc"
    hostname     = "app.terraform.io"

    workspaces {
      name = "gitops_temi_cluster"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = "~> 1.7" # your terraform cli version
}

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
