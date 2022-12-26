resource "aws_alb" "web_alb" {
  name = "web-alb"
  security_groups = [
    "${aws_security_group.tstapp-alb-sg.id}"
  ]
  subnets = [
    "${aws_subnet.tstapp-subnet1.id}",
    "${aws_subnet.tstapp-subnet2.id}"
  ]
cross_zone_load_balancing   = true
/*health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    interval = 30
    target = "HTTP:80/"
  }*/
listener {
    lb_port = 80
    lb_protocol = "http"
    instance_port = "80"
    instance_protocol = "http"
  }
}
