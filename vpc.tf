resource "aws_vpc" "tstapp-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = "true"
  tags = {
    Name = "TSTAPP-AWS-VPC"
  }
}
