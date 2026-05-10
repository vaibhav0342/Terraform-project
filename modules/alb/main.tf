resource "aws_lb" "jenkins_alb" {

  name               = "${var.project}-alb"
  internal           = true
  load_balancer_type = "application"

  security_groups = [
    var.alb_security_group_id
  ]

  subnets = var.private_subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = "${var.project}-alb"
  }
}

resource "aws_lb_target_group" "jenkins_tg" {

  name        = "${var.project}-tg"
  port        = 8080
  protocol    = "HTTP"
  target_type = "instance"

  vpc_id = var.vpc_id

  health_check {

    enabled = true

    protocol = "HTTP"

    path = "/login"

    matcher = "200"

    interval = 30
    timeout  = 5

    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "${var.project}-tg"
  }
}

resource "aws_lb_target_group_attachment" "jenkins" {

  target_group_arn = aws_lb_target_group.jenkins_tg.arn

  target_id = var.instance_id

  port = 8080
}

resource "aws_lb_listener" "https" {

  load_balancer_arn = aws_lb.jenkins_alb.arn

  port     = 443
  protocol = "HTTPS"

  ssl_policy      = "ELBSecurityPolicy-2016-08"
 

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.jenkins_tg.arn
  }
}