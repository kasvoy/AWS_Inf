resource "aws_autoscaling_group" "webASG"{

  name = "webASG"
  desired_capacity   = 2
  max_size           = 4
  min_size           = 2

  launch_template {
    id      = aws_launch_template.WebsiteTemplate.id
  }

  vpc_zone_identifier = [aws_subnet.primary_subnet.id, aws_subnet.secondary_subnet.id]

  target_group_arns = [aws_lb_target_group.websiteTG.arn]
}

resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.webASG.id
  lb_target_group_arn    = aws_lb_target_group.websiteTG.arn
}