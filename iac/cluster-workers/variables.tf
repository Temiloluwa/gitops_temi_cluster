variable "backend_instance_type" {
  type        = string
  description = "Instance type for the backend EC2"
}

variable "backend_volume_size" {
  type        = number
  description = "Backend EBS volume size"
}

variable "airflow_instance_type" {
  type        = string
  description = "Instance type for the airflow EC2"
}

variable "airflow_volume_size" {
  type        = number
  description = "airflow EBS volume size"
}

variable "development_server_instance_type" {
  type        = string
  description = "Instance type for the development_server EC2"
}

variable "development_server_volume_size" {
  type        = number
  description = "development_server EBS volume size"
}

variable "manager_swarm_id" {
  type        = string
  description = "Swarm manager Token ID"
}

variable "manager_ip" {
  type        = string
  description = "Swarm manager ip address"
}


variable "hyc-cluster-sg-tf-security_group_id" {
  type        = string
  description = "hyc-cluster-sg-tf-security_group_id"
}