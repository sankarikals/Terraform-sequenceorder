variable "aws_region" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}

variable "associate_public_ip_address" {
  type = bool
}

variable "user_data" {
  type = string
  default = ""
  
}
variable "servers" {
  description = "List of EC2 servers"

  type = list(object({
    name          = string
    ami_id        = string
    instance_type = string
    subnet_index  = number
    allowed_ports = list(number)
  }))
}