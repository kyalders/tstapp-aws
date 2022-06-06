resource "aws_instance" "test-ec2-1" {
  ami           = "ami-0fa49cc9dc8d62c84"
  instance_type = "t2.micro"
}

