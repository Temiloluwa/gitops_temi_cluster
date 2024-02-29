variable "prefix" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "volume_size" {
  type = number
}


variable "volume_type" {
  type = string
}

variable "key_pair_name" {
  type = string
  sensitive = true
}

variable "key_pair_content" {
  type        = string
  description = "content of key pair"
  sensitive = true
}

