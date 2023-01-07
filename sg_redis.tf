resource "aws_security_group" "tstapp_redis_security_group" {
  name        = "Moodle Redis Security Group"
  description = "Moodle Redis SG Module"
  vpc_id      = aws_vpc.tstapp-vpc.id

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
