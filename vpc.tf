resource "aws_vpc" "tstappvpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"
tags = {
    Name = "TSTAPP-AWS-VPC"
  }
}
