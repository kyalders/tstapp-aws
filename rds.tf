resource "aws_db_instance" "my_test_mysql" {
  allocated_storage           = 20
  storage_type                = "gp2"
  engine                      = "mysql"
  engine_version              = "5.7"
  instance_class              = var.db_instance
  db_name                     = "admindb"
  username                    = "admin"
  password                    = var.rds_password
  parameter_group_name        = "default.mysql5.7"
  db_subnet_group_name        = aws_db_subnet_group.rds-private-subnet.name
  vpc_security_group_ids      = ["${aws_security_group.tstapp-rds-sg.id}"]
  allow_major_version_upgrade = true
  auto_minor_version_upgrade  = true
  backup_retention_period     = 35
  backup_window               = "22:00-23:00"
  maintenance_window          = "Sat:00:00-Sat:03:00"
  multi_az                    = true
  skip_final_snapshot         = true

  provisioner "remote-exec" {
    connection {
      user     = "admin"
      password = var.rds_password
      host     = self.endpoint
      type     = "ssh"
    }

    inline = [
      # Download the SQL script from the S3 bucket
      "aws s3 cp s3://${aws_s3_bucket.moodle.bucket}/script.sql script.sql",
      # Execute the SQL script
      "mysql -u ${aws_db_instance_my_test_mysql.username} -p${var.rds_password} < script.sql"
    ]
  }
}
