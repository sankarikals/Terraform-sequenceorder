# Associate_public_ip_address

associate_public_ip_address = "true"

# environment

environment = "dev"

# region

aws_region  = "us-east-1"

# vpc module variables

vpc_cidr = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]

# server naming

servers = [
  {
    name = "server1"
    ami_id = "ami-0532be01f26a3de55"
    instance_type = "t3.micro"
    subnet_index = 0
    allowed_ports = [22,80,443]
  },
  {
    name = "server2"
    ami_id = "ami-0532be01f26a3de55"
    instance_type = "t3.micro"
    subnet_index = 0
    allowed_ports = [22,80,443]
  },
  {
    name = "server3"
    ami_id = "ami-0532be01f26a3de55"
    instance_type = "t3.small"
    subnet_index = 1
    allowed_ports = [22,443,80]
  },
  {
    name = "server4"
    ami_id = "ami-0532be01f26a3de55"
    instance_type = "t2.medium"
    subnet_index = 1
    allowed_ports = [22,80,443]
  }
]
