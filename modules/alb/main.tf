
resource "aws_lb" "this" {
  name               = "tf-${var.app_name}-web-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_groups]
  # subnets            = [for subnet in aws_subnet.public : subnet.id]
  subnets = var.public_subnets

  enable_deletion_protection = false

  /*   access_logs {
    bucket  = aws_s3_bucket.lb_logs.id
    prefix  = "test-lb"
    enabled = true
  } */

  tags = local.tags
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = var.http_port
  protocol          = "HTTP"
  #protocol          = "HTTPS"
  #ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}


resource "aws_lb_target_group" "this" {
  name     = "tf-${var.app_name}-lb-tg"
  port     = var.http_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "this" {
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = var.target_id
  port             = var.http_port
}
