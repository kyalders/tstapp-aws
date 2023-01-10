resource "aws_s3_bucket" "moodle-bucket" {
  bucket        = "moodle-private-bucket-${random_id.id.hex}"
  force_destroy = true
}

resource "aws_s3_bucket_acl" "moodle-bucket-acl" {
  bucket = aws_s3_bucket.moodle-bucket.id
  acl    = "private"
}

resource "aws_s3_object" "moodle-config" {
  bucket = aws_s3_bucket.moodle-bucket.id
  key    = "./moodle_setup.sql"
  source = "./moodle_setup.sql"
  depends_on = [
    aws_s3_bucket.moodle-bucket
  ]
}