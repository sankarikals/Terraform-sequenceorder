
# Shared DEV VPC


module "vpc" {
  source = "../../modules/vpc"

  environment = var.environment
  vpc_cidr    = var.vpc_cidr

  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

  availability_zones = var.availability_zones
}

# SERVER 


module "sg" {
  source = "../../modules/security_group"

  count = length(var.servers)

  name          = var.servers[count.index].name
  vpc_id        = module.vpc.vpc_id
  allowed_ports = var.servers[count.index].allowed_ports
}


module "iam" {
  source = "../../modules/iam-role"

  count = length(var.servers)

  name = var.servers[count.index].name
}

module "ec2" {
  source = "../../modules/ec2"

  count = length(var.servers)

  name        = var.servers[count.index].name
  environment = var.environment

  ami_id       = var.servers[count.index].ami_id
  instance_type = var.servers[count.index].instance_type

  associate_public_ip_address = var.associate_public_ip_address

  subnet_id = module.vpc.public_subnet_ids[
    var.servers[count.index].subnet_index
  ]

  security_group_id   = module.sg[count.index].security_group_id
  iam_instance_profile = module.iam[count.index].instance_profile_name

  tags = {
    Name = var.servers[count.index].name
  }

  user_data = templatefile(
    "${path.module}/../../userdata/server.tftpl",
    {
      environment = var.environment
      name        = var.servers[count.index].name
    }
  )
}

