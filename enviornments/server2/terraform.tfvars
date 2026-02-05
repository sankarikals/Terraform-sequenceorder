environment = "server2"
aws_region  = "us-east-1"
allowed_ports = [22, 80, 443,8080]
# environment   = "dev"
ami_id        = "ami-0532be01f26a3de55"   # Amazon Linux 2 
instance_type = "t2.medium"
vpc_cidr = "10.0.0.0/16"

public_subnet_cidrs = ["10.0.1.0/24"]
private_subnet_cidrs = ["10.0.101.0/24"]
availability_zones = ["us-east-1a"]