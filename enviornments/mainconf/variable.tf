
# region

variable "aws_region" {
  type = string
  
}
# Environment


variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

# vpc module

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

# associate_public_ip_address

variable "associate_public_ip_address" {
  type = string  
}

# Server creation toggles


variable "create_server1" {
  description = "Enable Server 1"
  type        = bool
}

variable "create_server2" {
  description = "Enable Server 2"
  type        = bool
}

variable "create_server3" {
  description = "Enable Server 3"
  type        = bool
}

variable "create_server4" {
  description = "Enable Server 4"
  type        = bool
}

variable "create_server5" {
  description = "Enable Server 4"
  type        = bool
}

variable "create_server6" {
  description = "Enable Server 4"
  type        = bool
}


# server names

variable "server1_name" {
  type = string
}

variable "server2_name" {
  type = string
  
}

variable "server3_name" {
  type = string
  
}

variable "server4_name" {
  type = string
  
}

variable "server5_name" {
  type = string
  
}

variable "server6_name" {
  type = string
  
}

# Instance types


variable "server1_instance_type" {
  description = "Server1 instance type"
  type        = string
}

variable "server2_instance_type" {
  description = "Server2 instance type"
  type        = string
}

variable "server3_instance_type" {
  description = "Server3 instance type"
  type        = string
}

variable "server4_instance_type" {
  description = "Server4 instance type"
  type        = string
}

variable "server5_instance_type" {
  description = "Server3 instance type"
  type        = string
}

variable "server6_instance_type" {
  description = "Server4 instance type"
  type        = string
}

# Ami_id

variable "server1_ami_id" {
  type = string
  
}
variable "server2_ami_id" {
  type = string
  
}
variable "server3_ami_id" {
  type = string
  
}
variable "server4_ami_id" {
  type = string
  
}

variable "server5_ami_id" {
  type = string
  
}
variable "server6_ami_id" {
  type = string
  
}

# Allowed ports

variable "server1_allowed_ports" {
  type = list(number)
  
}

variable "server2_allowed_ports" {
  type = list(number)
  
}

variable "server3_allowed_ports" {
  type = list(number)
  
}

variable "server4_allowed_ports" {
  type = list(number)
  
}

variable "server5_allowed_ports" {
  type = list(number)
  
}

variable "server6_allowed_ports" {
  type = list(number)
  
}

# user_data

variable "user_data" {
  type = string
  default = ""
  
}

# servertags

variable "server1_tags" {
  type = map(string)
  
}
variable "server2_tags" {
  type = map(string)
  
}
variable "server3_tags" {
  type = map(string)
  
}
variable "server4_tags" {
  type = map(string)
  
}

variable "server5_tags" {
  type = map(string)
  
}
variable "server6_tags" {
  type = map(string)
  
}