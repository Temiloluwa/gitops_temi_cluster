module "backend-node" {
  source                        = "../modules/compute"
  name                          = "backend-node"
  instance_type                 = var.backend_instance_type
  volume_size                   = var.backend_volume_size
  volume_type                   = "gp3"
  vpc_id                        = data.aws_vpc.default.id
  subnet_id                     = local.subnet_id
  security_group_id             = data.aws_security_group.hyc-cluster-sg-tf.id
  configuration_script_path     = "scripts/configure_backend.tpl"
  manager_swarm_id              = var.manager_swarm_id
  manager_ip                    = var.manager_ip
  use_aws_ami                   = true
  enable_termination_protection = false
  enable_stop_protection        = false
}


module "airflow-node" {
  source                        = "../modules/compute"
  name                          = "airflow-node"
  instance_type                 = var.airflow_instance_type
  volume_size                   = var.airflow_volume_size
  volume_type                   = "gp3"
  vpc_id                        = data.aws_vpc.default.id
  subnet_id                     = local.subnet_id
  security_group_id             = data.aws_security_group.hyc-cluster-sg-tf.id
  configuration_script_path     = "scripts/configure_airflow.tpl"
  manager_swarm_id              = var.manager_swarm_id
  manager_ip                    = var.manager_ip
  use_aws_ami                   = false
  enable_termination_protection = false
  enable_stop_protection        = false
}


module "development-server-node" {
  source                        = "../modules/compute"
  name                          = "development-server-node"
  instance_type                 = var.development_server_instance_type
  volume_size                   = var.development_server_volume_size
  volume_type                   = "gp3"
  vpc_id                        = data.aws_vpc.default.id
  subnet_id                     = local.subnet_id
  security_group_id             = aws_security_group.hyc-dev-server-sg-tf.id
  configuration_script_path     = "scripts/configure_development_server.tpl"
  manager_swarm_id              = var.manager_swarm_id
  manager_ip                    = var.manager_ip
  use_aws_ami                   = false
  enable_termination_protection = false
  enable_stop_protection        = false
}
