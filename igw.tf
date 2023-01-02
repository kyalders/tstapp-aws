resource "aws_internet_gateway" "tstapp-gateway" {
  vpc_id = "${aws_vpc.tstapp-vpc.id}"
}
