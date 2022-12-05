module "cluster" {
  source  = "terraform-aws-modules/rds-aurora/aws"

  name           = "tstapp-aurora-mysql"
  engine         = "aurora-mysql"
  engine_version = "5.7"
  instance_class = "db.t3.small"
  instances = {
    one = {}
    2 = {
      instance_class = "db.t3.small"
    }
  }

  vpc_id  = "${aws_vpc.tstappvpc.id}"
  subnets = [
    "${aws_subnet.tstapp-subnet1.id}",
    "${aws_subnet.tstapp-subnet2.id}"
  ]

  allowed_security_groups = ["${aws_vpc.tstappvpc.id}"]
  allowed_cidr_blocks     = [
    "${var.subnet1_cidr}",
    "${var.subnet2_cidr}"
  ]

  storage_encrypted   = true
  apply_immediately   = true
  monitoring_interval = 10

  db_parameter_group_name         = "default"
  db_cluster_parameter_group_name = "default"

  #enabled_cloudwatch_logs_exports = ["mysql"]

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
