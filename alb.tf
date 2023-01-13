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
}

resource "aws_lb_listener" "web_listener" {
  load_balancer_arn = aws_lb.web_alb.arn
  protocol          = "HTTP"
  port              = 80

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tstapp_target_group.arn
  }
}

resource "aws_lb_target_group" "tstapp_target_group" {
  name     = "tstapp-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.tstapp-vpc.id

  health_check {
    interval          = 30
    timeout           = 5
    healthy_threshold = 2
  }
}
