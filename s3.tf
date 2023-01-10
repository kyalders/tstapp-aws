resource "aws_s3_bucket" "moodle-bucket" {
  bucket        = "moodle-private-bucket-${random_id.id.hex}"
  force_destroy = true
}

resource "aws_s3_bucket_acl" "moodle-bucket-acl" {
  bucket = aws_s3_bucket.moodle-bucket.id
  acl    = "private"
}


data "template_file" "sql_setup" {
  template = file("moodle_setup.sql")

}

resource "aws_s3_object" "moodle-config" {
  bucket = aws_s3_bucket.moodle-bucket.id
  key    = data.template_file.sql_setup.rendered
  source = data.template_file.sql_setup.rendered
  depends_on = [
    aws_s3_bucket.moodle-bucket
  ]
}