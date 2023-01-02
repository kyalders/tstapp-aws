# Creating 1st subnet 
resource "aws_subnet" "tstapp-subnet1" {
  vpc_id                  = "${aws_vpc.tstapp-vpc.id}"
  cidr_block             = "${var.subnet1_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
tags = {
    Name = "Testapp subnet 1"
  }
}
# Creating 2nd subnet 
resource "aws_subnet" "tstapp-subnet2" {
  vpc_id                  = "${aws_vpc.tstapp-vpc.id}"
  cidr_block             = "${var.subnet2_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"
tags = {
    Name = "TSTapp subnet 2"
  }
}

