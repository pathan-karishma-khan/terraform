resource "aws_ecs_task_definition" "web-task" {
  family = "milife-web-task-definition"
  container_definitions = templatefile("task-definitions/web.tf.json", {
    aws_logs_region                = var.aws_region
    backend_image_repo_url         = var.BACKEND_IMAGE_REPO_URL
    nginx_image_repo_url           = var.NGINX_IMAGE_REPO_URL
    debug                          = var.DEBUG
    GITHUB_RUN_NUMBER              = var.GITHUB_RUN_NUMBER
    DJANGO_SETTINGS_MODULE         = var.DJANGO_SETTINGS_MODULE
    DATABASE_URL                   = var.DATABASE_URL
    ENABLE_MEDIA_UPLOAD_TO_S3      = var.ENABLE_MEDIA_UPLOAD_TO_S3
    DJANGO_AWS_ACCESS_KEY_ID       = var.DJANGO_AWS_ACCESS_KEY_ID
    DJANGO_AWS_SECRET_ACCESS_KEY   = var.DJANGO_AWS_SECRET_ACCESS_KEY
    DJANGO_AWS_STORAGE_BUCKET_NAME = var.DJANGO_AWS_STORAGE_BUCKET_NAME
    REDIS_URL                      = join("", ["redis://", aws_elasticache_cluster.milife-redis.cache_nodes.0.address, ":6379/0"])
    DJANGO_AWS_S3_REGION_NAME      = var.DJANGO_AWS_S3_REGION_NAME
    MILIFE_FOLDER_KEY              = var.MILIFE_FOLDER_KEY
    BRANCH_NAME                    = var.BRANCH_NAME

  })
  execution_role_arn       = data.aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "1024"
  memory                   = "4096"

  tags = {
    Role                = "Milife Web-Task definition"
    Name                = "AWS Web Task definition"
    Product_Environment = var.PRODUCT_ENVIRONMENT
    Product_Name        = "Milife"
    Subdepartment       = "Essentia"
  }
}
