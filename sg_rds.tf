resource "aws_security_group" "tstapp-rds-sg" {
  name        = "Moodle RDS Security Group"
  description = "Moodle RDS SG Module"
  vpc_id      = aws_vpc.tstapp-vpc.id
  # Inbound Rules
  # HTTP access from anywhere
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
