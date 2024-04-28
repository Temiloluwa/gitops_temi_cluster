data "aws_security_group" "hyc-cluster-sg-tf" {
  filter {
    name   = "hyc-cluster-sg-tf"
    values = ["true"]
  }
}