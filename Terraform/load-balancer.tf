resource "aws_lb_target_group" "milife-target-group" {
  name        = "milife-target-group"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = var.milife_vpc_id
  target_type = "ip"
  stickiness {
    enabled = false
    type    = "lb_cookie"
  }
  health_check {
    healthy_threshold   = "7" # The number of consecutive health checks successes
    unhealthy_threshold = "2" # The number of consecutive health checks failures
    interval            = "120"
    timeout             = "110"
    port                = "traffic-port"
    protocol            = "HTTP"
    matcher             = "200-205"
  }
  tags = {
    Role                = "Milife Target Group"
    Name                = "Milife Target Group"
    Product_Environment = var.PRODUCT_ENVIRONMENT
    Product_Name        = "Milife"
    Subdepartment       = "Essentia"
  }
}
resource "aws_lb" "milife-load-balancer" {
  name               = "milife-load-balancer"
  subnets            = var.milife_public_subnet_id_list
  security_groups    = var.milife_sg_id_list
  load_balancer_type = "application"
  tags = {
    Role                = "Milife Load Balancer"
    Name                = "Milife Load Balancer"
    Product_Environment = var.PRODUCT_ENVIRONMENT
    Product_Name        = "Milife"
    Subdepartment       = "Essentia"
  }
}
resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.milife-load-balancer.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.milife-target-group.arn
    type             = "forward"
  }
}
