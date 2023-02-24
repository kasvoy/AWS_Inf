resource "aws_lb_target_group" "websiteTG" {
  name        = "websiteTG"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.website_vpc.id

  health_check {
    path                = "/"
    port                = 80
    protocol            = "HTTP"
    matcher             = "200-499"
  }
}

resource "aws_lb" "webLB" {
  name               = "websiteLB"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_access.id]
  subnets            = [aws_subnet.primary_subnet.id, aws_subnet.secondary_subnet.id]
}

resource "aws_lb_listener" "lblistener" {
  load_balancer_arn = aws_lb.webLB.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.websiteTG.arn
    type             = "forward"
  }
}