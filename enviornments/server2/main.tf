module "vpc" {
  source = "../../modules/vpc"
  
  environment = var.environment
  /*
  vpc_cidr    = "10.0.0.0/16"  
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24"]
  
  */

  vpc_cidr               = var.vpc_cidr
  public_subnet_cidrs    = var.public_subnet_cidrs
  private_subnet_cidrs   = var.private_subnet_cidrs
  availability_zones     = var.availability_zones
  
  tags = {
    Environment = var.environment
    Team        = "DevOps"
    Owner       = "Development"
  }
}

module "security_group" {
  source = "../../modules/security_group"

  name          = "server2"
  vpc_id        = module.vpc.vpc_id
  allowed_ports = var.allowed_ports

  tags = {
    Environment = "server2"
  }
}

output "security_group_id" {
  value = module.security_group.security_group_id
}


module "iam_role_ssm" {
  source = "../../modules/iam-role"

  name = "server2"

  tags = {
    Environment = "server2"
  }
}

module "ec2" {
  source = "../../modules/ec2"
  #for_each      = toset(module.vpc.public_subnet_ids)
  count = length(module.vpc.public_subnet_ids)

  name                  = var.environment
  environment           = var.environment
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  subnet_id            = module.vpc.public_subnet_ids[count.index]
  #subnet_id             = each.value
  #subnet_id             = module.vpc.public_subnet_id[0]
  security_group_id     = module.security_group.security_group_id
  iam_instance_profile  = module.iam_role_ssm.instance_profile_name

  # user_data = file("${path.module}/user_data.sh")
  #user_data = file("./user_data.sh")
  # user_data = "${file("user_data.sh")}"
  #user_data = var.user_data
  user_data = file("${path.module}/user_data.sh")


  tags = {
    Environment = var.environment
  }
}
