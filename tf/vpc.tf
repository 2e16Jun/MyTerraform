############################################################
# VPC Module
############################################################
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = "my-vpc"
  cidr = var.vpc_cidr_block

  azs              = var.azs
  public_subnets   = slice(var.public_subnets, 0, var.public_subnet_count)
  private_subnets  = slice(var.private_subnets, 0, var.private_subnet_count)
  database_subnets = slice(var.private_subnets_db, 0, var.private_subnet_db_count)

  enable_ipv6        = true
  enable_nat_gateway = true
  enable_vpn_gateway = true

  public_subnet_tags = {

  }

  tags = var.vpc_tags
}
