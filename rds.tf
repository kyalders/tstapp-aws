resource "aws_db_instance" "my_test_mysql" {
  allocated_storage           = 20
  storage_type                = "gp2"
  engine                      = "mysql"
  engine_version              = "8.0"
  instance_class              = var.db_instance
  db_name                     = var.moodledbname
  username                    = var.moodledbuser
  password                    = var.rds_password
  character_set_name          = "utf8"
  db_subnet_group_name        = aws_db_subnet_group.rds-private-subnet.name
  vpc_security_group_ids      = ["${aws_security_group.tstapp-rds-sg.id}"]
  allow_major_version_upgrade = true
  auto_minor_version_upgrade  = true
  backup_retention_period     = 35
  backup_window               = "22:00-23:00"
  maintenance_window          = "Sat:00:00-Sat:03:00"
  multi_az                    = true
  skip_final_snapshot         = true

}

