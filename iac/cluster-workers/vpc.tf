resource "aws_security_group" "hyc-dev-server-sg-tf" {
  name        = "hyc-dev-server-sg-tf"
  description = "Security group for Hifeyinc dev-server"
  vpc_id      = data.aws_vpc.default.id

  tags = {
    Name = "${local.prefix}-dev-server-tf-sg"
  }

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_vpc_security_group_ingress_rule" "tcp" {
  security_group_id = aws_security_group.hyc-dev-server-sg-tf.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 1
  ip_protocol       = "tcp"
  to_port           = 10000
  tags = {
    Name = "http"
  }
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.hyc-dev-server-sg-tf.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
