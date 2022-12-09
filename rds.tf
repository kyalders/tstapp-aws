# Note, must comment this whole file upon initial build. Need to enable key after it's built and then run:
# aws kms encrypt --key-id <kms key id> --plaintext admin123 --output text --query CiphertextBlob
# in aws console

data "aws_kms_secret" "rds-secret" {
  secret {
    name = "master_password"
    payload = "AQICAHiSb3p1R70gmxMrrQNK4gw26AT/ZITG3zWiHDWtJApAhgGfrsWnHk1A7J063/WvqBVLAAAAZDBiBgkqhkiG9w0BBwagVTBTAgEAME4GCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMEJnt+f6kiDjrStJVAgEQgCGnZFaG10fYaA5MNblxe+TQxDNYRRGX6zG4JR/6/zzjQ5Q="
  }
}

resource "aws_db_instance" "my_test_mysql" {
  allocated_storage           = 50
  storage_type                = "gp2"
  engine                      = "mysql"
  engine_version              = "8.0"
  instance_class              = "${var.db_instance}"
  name                        = "myrdstestmysql"
  username                    = "admin"
  password                    = "${data.aws_kms_secret.rds-secret.name}"
  parameter_group_name        = "default.mysql8.0"
  db_subnet_group_name        = "${aws_db_subnet_group.rds-private-subnet.name}"
  vpc_security_group_ids      = ["${aws_security_group.tstapp-rds-sg.id}"]
  allow_major_version_upgrade = true
  auto_minor_version_upgrade  = true
  backup_retention_period     = 35
  backup_window               = "22:00-23:00"
  maintenance_window          = "Sat:00:00-Sat:03:00"
  multi_az                    = true
  skip_final_snapshot         = true
}

