
# Shared DEV VPC


module "vpc" {
  source = "../../modules/vpc"

  environment = var.environment
  vpc_cidr    = var.vpc_cidr

  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

  availability_zones = var.availability_zones
}

# SERVER 1

module "sg_server1" {
  source = "../../modules/security_group"

  name   = var.server1_name
  vpc_id = module.vpc.vpc_id
  allowed_ports = var.server1_allowed_ports
}

module "iam_server1" {
  source = "../../modules/iam-role"

  name = var.server1_name
}

module "server1" {
  source = "../../modules/ec2"

  count = var.create_server1 ? 1 : 0

  name              = var.server1_name
  environment       = var.environment
  ami_id            = var.server1_ami_id
  associate_public_ip_address = var.associate_public_ip_address
  instance_type     = var.server1_instance_type
  subnet_id         = module.vpc.public_subnet_ids[0]
  security_group_id = module.sg_server1.security_group_id
  iam_instance_profile = module.iam_server1.instance_profile_name
  user_data = templatefile("${path.module}/../../userdata/server1.tftpl", {
    environment = var.environment
  })

  # user_data = file("${path.module}/userdata/server1.sh")
}


# SERVER 2 (depends on 1)


module "sg_server2" {
  source = "../../modules/security_group"
  name   = var.server2_name
  vpc_id = module.vpc.vpc_id
  allowed_ports = var.server2_allowed_ports
}

module "iam_server2" {
  source = "../../modules/iam-role"
  name   = var.server2_name
}

module "server2" {
  source = "../../modules/ec2"

  #count = var.create_server2 ? 1 : 0
  count = var.create_server1 && var.create_server2 ? 1 : 0

  #depends_on = [module.server1]

  name              = var.server2_name
  environment       = var.environment
  ami_id            = var.server2_ami_id
  associate_public_ip_address = var.associate_public_ip_address
  instance_type     = var.server2_instance_type
  subnet_id         = module.vpc.public_subnet_ids[0]
  security_group_id = module.sg_server2.security_group_id
  iam_instance_profile = module.iam_server2.instance_profile_name
  user_data = templatefile("${path.module}/../../userdata/server2.tftpl", {
    environment = var.environment
  })

  # user_data = file("${path.module}/userdata/server2.sh")
}

# SERVER 3 (depends on 2)

module "sg_server3" {
  source = "../../modules/security_group"
  name   = var.server3_name
  vpc_id = module.vpc.vpc_id
  allowed_ports = var.server3_allowed_ports
}

module "iam_server3" {
  source = "../../modules/iam-role"
  name   = var.server3_name
}

module "server3" {
  source = "../../modules/ec2"

  #count = var.create_server3 ? 1 : 0\
  count = var.create_server2 && var.create_server3 ? 1 : 0


  #depends_on = [module.server2]

  name              = var.server3_name
  environment       = var.environment
  ami_id            = var.server3_ami_id
  associate_public_ip_address = var.associate_public_ip_address
  instance_type     = var.server3_instance_type
  subnet_id         = module.vpc.public_subnet_ids[1]
  security_group_id = module.sg_server3.security_group_id
  iam_instance_profile = module.iam_server3.instance_profile_name
  user_data = templatefile("${path.module}/../../userdata/server3.tftpl", {
    environment = var.environment
  })

  #user_data = file("${path.module}/userdata/server3.sh")
}


# SERVER 4 (depends on 3)


module "sg_server4" {
  source = "../../modules/security_group"
  name   = var.server4_name
  vpc_id = module.vpc.vpc_id
  allowed_ports = var.server4_allowed_ports
}

module "iam_server4" {
  source = "../../modules/iam-role"
  name   = var.server4_name
}

module "server4" {
  source = "../../modules/ec2"

  #count = var.create_server4 ? 1 : 0
  count = var.create_server3 && var.create_server4 ? 1 : 0


  #depends_on = [module.server3]

  name              = var.server4_name
  environment       = var.environment
  ami_id            = var.server4_ami_id
  associate_public_ip_address = var.associate_public_ip_address
  instance_type     = var.server4_instance_type
  subnet_id         = module.vpc.public_subnet_ids[1]
  security_group_id = module.sg_server4.security_group_id
  iam_instance_profile = module.iam_server4.instance_profile_name
  user_data = templatefile("${path.module}/../../userdata/server4.tftpl", {
    environment = var.environment
  })

  #user_data = file("${path.module}/userdata/server4.sh")
}
