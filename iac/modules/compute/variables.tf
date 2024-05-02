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

variable "vpc_id" {
  type      = string
  description = "ID of VPC"
}

variable "subnet_id" {
  type      = string
  description = "ID of Subnet"
}

variable "security_group_id" {
  type      = string
  description = "ID of security group"
}

variable "configuration_script_path" {
  type      = string
  description = "Configuration script path"
}

variable "manager_swarm_id" {
  type      = string
  description = "swarm manager token id"
  default = ""
}

variable "manager_ip" {
  type      = string
  description = "swarm manager ip address"
  default = ""
}

variable "use_aws_ami" {
  type    = bool
  default = true
  description = "Flag to Use AWS AMI" 
}


variable "enable_stop_protection" {
  type    = bool
  default = true
  description = "Enable Stop Protection" 
}


variable "enable_termination_protection" {
  type    = bool
  default = true
  description = "Enable Termination Protection" 
}

