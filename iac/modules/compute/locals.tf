locals {
   subnet_id = var.subnet_id
   prefix = "hyc"
   ami_id = var.use_aws_ami ?  data.aws_ami.amazon_linux.id: data.aws_ami.ubuntu.id
   key_pair_name = "hifeyinc-cluster-key"
}