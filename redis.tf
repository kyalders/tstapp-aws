resource "aws_elasticache_cluster" "tstapp_redis_cluster" {
  cluster_id          = "tstapp-redis-cluster"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  port                 = 6379
  parameter_group_name = "default.redis5.0"
  security_group_ids   = [aws_security_group.tstapp_redis_security_group.id]
  subnet_group_name    = aws_elasticache_subnet_group.redis_subnet_group.name
}
