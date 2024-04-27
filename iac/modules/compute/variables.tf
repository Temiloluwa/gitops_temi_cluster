variable "name" {
  type      = string
  description = "Name of Compute Instance"
}

variable "instance_type" {
  type      = string
  description = "The type of ec2 instance e.g t2.micro"
}

variable "instance_count" {
  type = number
  description = "Number of Instances to create"
  default = 1
}


variable "volume_size" {
  type = number
  description = "The size of the ebs volume"
}

variable "volume_type" {
  type = string
  description = "The type of the ebs volume"
}


variable "configuration_script_path" {
  type      = string
  description = "Configuration script path"
}

variable "manager_swarm_id" {
  type      = string
  description = "Configuration script path"
  default = ""
}

variable "use_aws_ami" {
  type    = bool
  default = true
  description = "Flag to Use AWS AMI" 
}
