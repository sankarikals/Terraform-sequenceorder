variable "region" {
  description = "AWS region for server1 environment"
  type        = string
  default     = "us-east-1"
}

variable "instance_name" {
  description = "EC2 instance name"
  type        = string
  default     = "server1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
  default = "ami-0532be01f26a3de55"
}

variable "subnet_id" {
  description = "Subnet ID for EC2"
  type        = string
}

variable "sg_name" {
  description = "Security group name"
  type        = string
  default     = "server1-sg"
}

variable "ingress_ports" {
  description = "Allowed inbound ports"
  type        = list(number)
  default     = [22, 80]
}
