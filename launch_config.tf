output "redis_domain_name" {
  description = "Domain Name of Redis Endpoint"
  value       = aws_elasticache_cluster.tstapp_redis_cluster.cluster_address
}

data "template_file" "user_data" {
  template = file("data.sh")

  vars = {
    moodledbhost   = "${aws_db_instance.my_test_mysql.endpoint}"
    moodledbuser   = "moodleuser"
    moodledbpw     = "${var.rds_password}"
    moodlealb      = "${aws_lb.web_alb.dns_name}"
    redis          = "${output.redis_domain_name.value}"
  }
}

resource "aws_launch_configuration" "web" {
  name_prefix                 = "web-"
  image_id                    = "ami-0b5eea76982371e91"
  instance_type               = "t2.micro"
  key_name                    = "tstapp"
  security_groups             = ["${aws_security_group.tstapp-ec2-sg.id}"]
  associate_public_ip_address = true
  user_data                   = data.template_file.user_data.rendered
  lifecycle {
    create_before_destroy = true
  }
}
