variable "BACKEND_IMAGE_REPO_URL" {
  type        = string
  description = "ECR Image URI for backend"
}

variable "NGINX_IMAGE_REPO_URL" {
  type        = string
  description = "ECR Image URI for nginx"
}



variable "DEBUG" {
  type        = string
  description = "Debug Paramater here"
}

variable "DATABASE_URL" {
  description = "DATABASE_URL"
}

variable "DJANGO_SETTINGS_MODULE" {
  description = "DJANGO_SETTINGS_MODULE"
}
variable "SENTRY_DSN" {
  type        = string
  description = "Sentry DSN for backend"
}

variable "MILIFE_FOLDER_KEY" {
  type        = string
  description = "MILIFE_FOLDER_KEY"
}

variable "ecs_cluster" {
  default     = "mmilife-cluster"
  type        = string
  description = "ECS cluster name"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
}


variable "milife_vpc_id" {
  type        = string
  description = "VPC id for milife"
}

variable "milife_public_subnet_id_list" {
  type        = list
  description = "milife Public subnet id list"
}

variable "milife_private_subnet_id_list" {
  type        = list
  description = "milife Public subnet id list"
}

variable "milife_sg_id_list" {
  type        = list
  description = "milife security Groups list"
}

variable "max_capacity" {
  description = "Maximum number of instances in the cluster"
}

variable "min_capacity" {
  description = "Minimum number of instances in the cluster"
}

variable "desired_capacity" {
  description = "Desired number of instances in the cluster"
}

variable "domain" {
  default     = "milife-es"
  type        = string
  description = "Domain name for elastic search service"
}

variable "GITHUB_RUN_NUMBER" {
  description = "Travis build number to tag docker builds"
}

variable "ENABLE_MEDIA_UPLOAD_TO_S3" {
  type        = string
  description = ""
}
variable "DJANGO_AWS_ACCESS_KEY_ID" {
  type        = string
  description = ""
}
variable "DJANGO_AWS_SECRET_ACCESS_KEY" {
  type        = string
  description = ""
}
variable "DJANGO_AWS_STORAGE_BUCKET_NAME" {
  type        = string
  description = ""
}
variable "DJANGO_AWS_S3_REGION_NAME" {
  type        = string
  description = ""
}
variable "BRANCH_NAME" {
  type        = string
  description = ""
}
