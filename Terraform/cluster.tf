resource "aws_ecs_cluster" "milife_cluster" {
  name = "milife_cluster-${var.PRODUCT_ENVIRONMENT}"

  tags = {
    Role                = "MILIFE ECS Cluster"
    Name                = "ECS"
    Product_Environment = var.PRODUCT_ENVIRONMENT
    Product_Name        = "MILIFE"
    Subdepartment       = "Essentia"
  }
}