terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "naija-highlights"
    key    = "iac/state/terraform.tfstate"
    region = "us-east-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}


resource "aws_s3_bucket" "sample" {
  bucket = "the-new-init-s3-bucket-sample-to-be-deleted"

  tags = {
    Name        = "init-s3-bucket"
    Environment = "prod"
  }
}