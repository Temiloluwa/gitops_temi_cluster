locals {
  region = "us-east-1"
  prefix = "hyc"

  tags = {
    owner       = "temi"
    project     = "temi-gitops-cluster"
    created_by  = "terraform"
    environment = "prod"
  }
}