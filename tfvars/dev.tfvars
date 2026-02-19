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

server1_name = "server1"
server2_name = "server2"
server3_name = "server3"
server4_name = "server4"

# Server enable flags


create_server1 = true
create_server2 = true
create_server3 = true
create_server4 = true


# Instance sizes

instance_type_sequence = [
  "t2.micro",
  "t2.medium"
]

/*
server1_instance_type = "t2.micro"
server2_instance_type = "t2.medium"
server3_instance_type = "t2.micro"
server4_instance_type = "t2.medium"

*/

# Ami_id

server1_ami_id  = "ami-0532be01f26a3de55"
server2_ami_id  = "ami-0532be01f26a3de55"
server3_ami_id  = "ami-0532be01f26a3de55"
server4_ami_id  = "ami-0532be01f26a3de55"

# allowed ports

server1_allowed_ports = [22, 80, 443]
server2_allowed_ports = [22, 80, 443]
server3_allowed_ports = [22, 80, 443]
server4_allowed_ports = [22, 80, 443]

# server tags

server1_tags = {
    Name = "dev-server1-ec2"
    environment = "dev"
    Dependency  = "Initial"
}

server2_tags = {
    Name = "dev-server2-ec2"
    environment = "dev"
    Dependency  = "Depends on server1"
}

server3_tags = {
    Name = "dev-server3-ec2"
    environment = "dev"
    Dependency  = "Depends on server2"
}

server4_tags = {
    Name = "dev-server4-ec2"
    environment = "dev"
    Dependency  = "Depends on server3"
}
