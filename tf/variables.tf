variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "ap-northeast-2"
}

# Amazon Linux 2 Kernel 5.10 AMI 2.0.20221210.1 x86_64 HVM gp2
variable "aws_amis" {
  default = {
    ap-northeast-2 = "ami-035233c9da2fabf52"
  }
}


