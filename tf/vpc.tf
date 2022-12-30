############################################################
# VPC Module
############################################################
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs = ["ap-northeast-2a","ap-northeast-2c"]
  private_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets   = ["10.0.101.0/24", "10.0.102.0/24"]
  database_subnets = ["10.0.103.0/24", "10.0.104.0/24"]

  enable_ipv6 = true

  
  enable_nat_gateway = true
  enable_vpn_gateway = true

  public_subnet_tags = {

  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}