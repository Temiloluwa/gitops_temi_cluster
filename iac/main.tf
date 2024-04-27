module "manager" {
  source                    = "./modules/compute"
  name                      = "manager"
  instance_type             = "t4g.micro"
  volume_size               = 50
  volume_type               = "gp3"
  configuration_script_path = "scripts/configure_manager.tpl"
  use_aws_ami               = true
}
