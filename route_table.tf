#Creating Route Table
resource "aws_route_table" "route" {
  vpc_id = aws_vpc.tstapp-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tstapp-gateway.id
  }
  tags = {
    Name = "Route to internet"
  }
}
resource "aws_route_table_association" "rt1" {
  subnet_id      = aws_subnet.tstapp-subnet1.id
  route_table_id = aws_route_table.route.id
}
resource "aws_route_table_association" "rt2" {
  subnet_id      = aws_subnet.tstapp-subnet2.id
  route_table_id = aws_route_table.route.id
}
