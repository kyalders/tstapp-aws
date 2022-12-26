resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name        = "redis-subnet-group"
  description = "TSTAPP Elasticache subnet group"
  subnet_ids  = [
    "${aws_subnet.tstapp-subnet1.id}",
    "${aws_subnet.tstapp-subnet2.id}"
  ]
}
