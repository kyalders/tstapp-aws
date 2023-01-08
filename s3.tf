resource "aws_s3_bucket" "moodle" {
  bucket        = "moodle-private-bucket-${random_id.id.hex}"
  acl           = "private"
  force_destroy = true
}

resource "aws_s3_bucket_object" "moodle" {
  bucket = aws_s3_bucket.moodle.id
  key    = "moodle_setup.sql"
  source = file("moodle_setup.sql")
  depends_on = [
    aws_s3_bucket.moodle
  ]
}