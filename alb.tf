resource "aws_lb" "web_alb" {
  name = "web-alb"
  security_groups = [
    "${aws_security_group.tstapp-alb-sg.id}"
  ]
  subnets = [
    "${aws_subnet.tstapp-subnet1.id}",
    "${aws_subnet.tstapp-subnet2.id}"
  ]
  enable_cross_zone_load_balancing = true
  /*health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    interval = 30
    target = "HTTP:80/"
  }*/
}

resource "aws_lb_listener" "web_listener" {
  load_balancer_arn = aws_lb.web_alb.arn
  protocol          = "HTTP"
  port              = 80

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_target_group.arn
  }
}

resource "aws_lb_target_group" "web_target_group" {
  name     = "my-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.tstapp-vpc.id
}
