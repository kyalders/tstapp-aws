resource "aws_launch_template" "web_template" {
  name_prefix   = "web"
  image_id      = "ami-0beaa649c482330f7"
  instance_type = "t2.small"
  user_date = filebase64("apache.sh")
}

resource "aws_autoscaling_group" "web_asg" {
    availability_zones = ["us-east-2a"]
    desired_capacity   = 1
    max_size           = 1
    min_size           = 1

    launch_template = {
      id      = "${aws_launch_template.web_template.id}"
      version = "$$Latest"
    }
}