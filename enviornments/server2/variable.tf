variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "allowed_ports" {
  description = "Allowed inbound ports for DEV"
  type        = list(number)
}



variable "environment" {
  description = "Environment name (dev, qa, prod)"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
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


/*
variable "user_data" {
  description = "User data script"
  type        = string
}

/*
variable "environment" {
  type    = string
  default = "dev"
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

*/
