resource "aws_instance" "test-ec2-1" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
}

resource "aws_instance" "test-ec2-2" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
}
