locals {
   subnet_id = element(tolist(data.aws_subnets.default.ids), 0)
   prefix = "hyc"
   ami_id = var.use_aws_ami ?  data.aws_ami.amazon_linux.id: data.aws_ami.ubuntu.id
   key_pair_name = "hifeyinc-cluster-key"
}