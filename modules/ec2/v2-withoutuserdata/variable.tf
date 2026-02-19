variable "name" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "iam_instance_profile" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "environment" {
  description = "Environment name (dev, qa, prod)"
  type        = string
}


variable "associate_public_ip_address" {
  type = bool
  
}

/*
variable "user_data" {
  description = "User data script"
  type        = string
}
*/