data "template_file" "ansible_config" {
  template = <<EOF
#!/bin/bash

# Install Ansible
sudo yum update -y
sudo yum install mysql -y
sudo amazon-linux-extras install ansible2 -y
EOF
}

resource "aws_instance" "ansible_host" {
  ami                    = "ami-0b5eea76982371e91"
  instance_type          = "t2.micro"
  key_name               = "tstapp"
  vpc_security_group_ids = ["${aws_security_group.tstapp-ec2-sg.id}"]
  subnet_id              = aws_subnet.tstapp-subnet1.id

  # Add a root volume
  root_block_device {
    volume_type           = "gp2"
    volume_size           = 15
    delete_on_termination = true
  }
  user_data = data.template_file.ansible_config.rendered
}
