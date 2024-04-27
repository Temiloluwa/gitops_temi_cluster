locals {
  region = "us-east-1"

  tags = {
    owner       = "temi"
    project     = "temi-gitops-cluster"
    created_by  = "terraform"
    environment = "prod"
  }
}