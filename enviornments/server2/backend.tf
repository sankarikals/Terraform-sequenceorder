terraform {
  backend "s3" {
    bucket  = "terraform-state-server2-530743905801"
    key     = "infra/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
