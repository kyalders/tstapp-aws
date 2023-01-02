resource "aws_db_subnet_group" "rds-private-subnet" {
  name = "rds-private-subnet-group"
  subnet_ids = ["${aws_subnet.tstapp-subnet1.id}",
  "${aws_subnet.tstapp-subnet2.id}"]
}

