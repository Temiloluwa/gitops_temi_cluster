locals {
  region = "us-east-1"
  tf_cloud = {
    organization = "hifeyinc"
    workspace    = "temi-gitops-cluster"
  }

  tags = {
    owner       = "temi"
    project     = "temi-gitops-cluster"
    created_by  = "terraform"
    environment = "prod"
  }
}