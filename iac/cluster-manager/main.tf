module "manager" {
  source                        = "../modules/compute" # ensure to set the terraformin working directory in terraform cloud
  name                          = "manager"
  instance_type                 = "t4g.micro"
  volume_size                   = 50
  volume_type                   = "gp3"
  vpc_id                        = data.aws_vpc.default.id
  subnet_id                     = local.subnet_id
  security_group_id             = aws_security_group.hyc-cluster-sg-tf.id
  configuration_script_path     = "scripts/configure_manager.tpl"
  use_aws_ami                   = true
  enable_termination_protection = true
  enable_stop_protection        = true
}
