resource "aws_cloudwatch_log_group" "milife-log-group" {
  name = "milife-log-group-${var.PRODUCT_ENVIRONMENT}"

  tags = {
    Role                = "milife log group"
    Name                = "Amazon CloudWatch Logs"
    Product_Environment = var.PRODUCT_ENVIRONMENT
    Product_Name        = "Milife"
    Subdepartment       = "Essentia"
  }
}