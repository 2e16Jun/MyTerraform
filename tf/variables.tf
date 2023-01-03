variable "project_name" {
  description = "Name of the project."
  type        = string
  default     = "my-project"
}

variable "environment" {
  description = "Name of the environment."
  type        = string
  default     = "dev"
}

 variable "resource_tags" {
   description = "Tags to set for all resources"
   type        = map(string)
   default     = {}
 }

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-northeast-2"
}


variable "aws_amis" {
  description = ""
  type        = map(string)
  default = {
    ap-northeast-2 = "ami-035233c9da2fabf52" # Amazon Linux 2 Kernel 5.10 AMI 2.0.20221210.1 x86_64 HVM gp2
  }
}

############################################################
# VPC Module
# https://github.com/terraform-aws-modules/terraform-aws-vpc
############################################################

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Available zone"
  type        = list(string)
  default = [
    "ap-northeast-2a",
    "ap-northeast-2c",
  ]
}

variable "public_subnet_count" {
  description = "Number of public subnets."
  type        = number
  default     = 2
}

variable "private_subnet_count" {
  description = "Number of private subnets."
  type        = number
  default     = 2
}

variable "private_subnet_db_count" {
  description = "Number of private subnets for db."
  type        = number
  default     = 2

  validation {
    condition     = var.private_subnet_db_count <= 8
    error_message = "private_subnet not enough"
  }
}

variable "public_subnets" {
  description = "Available cidr blocks for public subnets."
  type        = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24",
    "10.0.7.0/24",
    "10.0.8.0/24",
  ]
}

variable "private_subnets" {
  description = "Available cidr blocks for private subnets."
  type        = list(string)
  default = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24",
    "10.0.104.0/24",
    "10.0.105.0/24",
    "10.0.106.0/24",
    "10.0.107.0/24",
    "10.0.108.0/24",
  ]
}

variable "private_subnets_db" {
  description = "Available cidr blocks for private subnets for DB."
  type        = list(string)
  default = [
    "10.0.201.0/24",
    "10.0.202.0/24",
    "10.0.203.0/24",
    "10.0.204.0/24",
    "10.0.205.0/24",
    "10.0.206.0/24",
    "10.0.207.0/24",
    "10.0.208.0/24",
  ]
}

variable "vpc_tags" {
  description = ""
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "deploy"
  }
}