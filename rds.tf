resource "aws_db_instance" "my_test_mysql" {
  allocated_storage           = 20
  storage_type                = "gp2"
  engine                      = "mysql"
  engine_version              = "5.7"
  instance_class              = var.db_instance
  db_name                     = "default"
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

  command {
    sql                 = "CREATE DATABASE moodle DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
    continue_on_failure = false
  }

  command {
    sql                 = "CREATE USER 'moodleuser'@'%' IDENTIFIED BY '${MYSQL_MOODLE_PW}';"
    database_name       = "moodle"
    continue_on_failure = true
  }

  command {
    sql                 = "GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES,DROP,INDEX,ALTER ON moodle.* TO 'moodleuser'@'%';"
    database_name       = "moodle"
    continue_on_failure = true
  }

  command {
    sql                 = "GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES,DROP,INDEX,ALTER ON moodle.* TO 'moodleuser'@'%';"
    database_name       = "moodle"
    continue_on_failure = true
  }

  command {
    sql                 = "FLUSH PRIVILEGES;"
    database_name       = "moodle"
    continue_on_failure = true
  }
}
