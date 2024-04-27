resource "aws_instance" "hyc-compute" {
  ami           = local.ami_id
  instance_type = var.instance_type
  subnet_id     = local.subnet_id
  count = var.instance_count > 1 ? var.instance_count : 1

  tags = {
    Name = "${local.prefix}-${var.name}-${count.index}"
  }

  vpc_security_group_ids = [aws_security_group.hyc-cluster-sg-tf.id]

  key_name = local.key_pair_name
  
  ebs_block_device {
    device_name = "/dev/xvda" 
    volume_size = var.volume_size
    volume_type = var.volume_type
    delete_on_termination = true

    tags = {
    Name = "${local.prefix}-${var.name}-${count.index}"
  }
  }

  user_data = templatefile(var.configuration_script_path,
    {
      manager_swarm_id = var.manager_swarm_id
  })
}
