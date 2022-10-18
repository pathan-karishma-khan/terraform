resource "aws_ecs_service" "web-service" {
  name            = "web-service"
  cluster         = aws_ecs_cluster.milife_cluster.id
  task_definition = aws_ecs_task_definition.web-task.family
  desired_count   = 1
  launch_type     = "FARGATE"
  network_configuration {
    assign_public_ip = true
    security_groups  = var.milife_sg_id_list
    subnets          = var.milife_private_subnet_id_list
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.milife-target-group.arn
    container_port   = 80
    container_name   = "nginx"
  }
  propagate_tags = "TASK_DEFINITION"
  depends_on     = [aws_lb.milife-load-balancer]
  tags = {
    Role                = "Milife Web Service"
    Name                = "Milife Web Service"
    Product_Environment = var.PRODUCT_ENVIRONMENT
    Product_Name        = "Milife"
    Subdepartment       = "Essentia"
  }
}