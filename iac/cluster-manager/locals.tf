locals {
  region    = "us-east-1"
  prefix    = "hyc"
  subnet_id = element(tolist(data.aws_subnets.default.ids), 0)

  tags = {
    owner       = "temi"
    project     = "temi-gitops-cluster"
    created_by  = "terraform"
    environment = "prod"
  }
}