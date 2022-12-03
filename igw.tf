resource "aws_internet_gateway" "tstapp-gateway" {
  vpc_id = "${aws_vpc.tstappvpc.id}"
}
