module "manager" {
  source                    = "../modules/compute"
  name                      = "manager"
  instance_type             = "t4g.micro"
  volume_size               = 50
  volume_type               = "gp3"
  security_group_id =     aws_security_group.hyc-cluster-sg-tf
  configuration_script_path = "scripts/configure_manager.tpl"
  use_aws_ami               = true
  enable_termination_protection = false
  enable_stop_protection = true
}
