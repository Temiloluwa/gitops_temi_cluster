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


resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.hyc-dev-server-sg-tf.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
  tags = {
    Name = "https"
  }
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.hyc-dev-server-sg-tf.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
  tags = {
    Name = "http"
  }
}

resource "aws_vpc_security_group_ingress_rule" "dev-ports" {
  security_group_id = aws_security_group.hyc-dev-server-sg-tf.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 8000
  ip_protocol       = "tcp"
  to_port           = 8100
  tags = {
    Name = "dev-ports"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.hyc-dev-server-sg-tf.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  tags = {
    Name = "ssh"
  }
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.hyc-dev-server-sg-tf.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
