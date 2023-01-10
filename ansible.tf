resource "aws_instance" "ansible_host" {
  name                   = "ansible"
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

    user_data = <<EOF
#!/bin/bash

# Install Ansible
sudo yum update -y
sudo yum install mysql -y
sudo amazon-linux-extras install ansible2
sudo pip install ansible-galaxy
export MYSQL_MOODLE_PW

# Download the SQL script from the S3 bucket
aws s3 cp s3://${aws_s3_bucket.moodle-bucket.buket}/moodle_setup.sql moodle_setup.sql

# Connect to RDS instance and execute SQL script
mysql -h ${aws_db_instance.my_test_mysql.address} -u admin -p ${var.rds_password} < moodle_setup.sql

EOF
}
