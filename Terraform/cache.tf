resource "aws_elasticache_subnet_group" "milife-cache-subnet" {
  name       = "milife-cache-subnet-${var.PRODUCT_ENVIRONMENT}"
  subnet_ids = var.milife_public_subnet_id_list
}


resource "aws_elasticache_cluster" "milife-redis" {
  cluster_id           = "milife-redis"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis5.0"
  engine_version       = "5.0.6"
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.milife-cache-subnet.name
  security_group_ids   = var.milife_sg_id_list
  tags = {
    Role             = "Milife cache service"
    Name             = "ElastiCache Cluster "
    Product_Name     = "Milife"
    Product_Environment = var.PRODUCT_ENVIRONMENT
    Subdepartment    = "Essentia"
  }
}
