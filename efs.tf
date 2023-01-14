resource "aws_efs_file_system" "moodle-efs" {
  creation_token = "moodle-${random_id.id.hex}"
}

resource "aws_efs_mount_target" "moodle-mnt-target" {
  file_system_id = aws_efs_file_system.moodle-efs.id
  subnet_id      = [
    "${aws_subnet.tstapp-subnet1.id}",
    "${aws_subnet.tstapp-subnet2.id}"
  ]
}