 resource "aws_security_group" "moodle-efs-sg" {
  name        = "Moodle EFS Security Group"
  description = "Moodle EFS SG Module"
  vpc_id      = aws_vpc.tstapp-vpc.id
 
 # EFS Access
  ingress {
description = "EFS mount target"
from_port   = 2049
to_port     = 2049
protocol    = "tcp"
cidr_blocks = ["0.0.0.0/0"]
  }
 }