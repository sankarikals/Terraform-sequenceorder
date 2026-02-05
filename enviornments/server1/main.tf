provider "aws" {
  region = var.region
}

# --- Security Group ---
module "sg" {
  source = "../../modules/security-group"

  sg_name       = var.sg_name
  ingress_ports = var.ingress_ports
}

# --- EC2 Instance ---
module "ec2" {
  source = "../../modules/ec2"

  instance_name = var.instance_name
  instance_type = var.instance_type
  ami_id        = var.ami_id
  subnet_id     = var.subnet_id
  sg_id = module.sg.sg_id

  user_data = file("${path.module}/userdata.sh")
}
