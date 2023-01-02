resource "aws_vpc" "tstapp-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name = "TSTAPP-AWS-VPC"
  }
}
