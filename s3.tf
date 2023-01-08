resource "aws_s3_bucket" "moodle" {
  bucket        = "moodle-private-bucket-testProject123"
  acl           = "private"
  force_destroy = true
}

resource "aws_s3_bucket_object" "moodle" {
  bucket = aws_s3_bucket.moodle.id
  key    = "moodle_setup.sql"
  source = "moodle_setup.sql"
}