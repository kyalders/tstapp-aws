resource "aws_efs_file_system" "moodle-efs" {
  creation_token = "moodle-${random_id.id.hex}"
}

resource "aws_efs_mount_target" "moodle-mnt-target-subnet1" {
  file_system_id = aws_efs_file_system.moodle-efs.id
  subnet_id = "${aws_subnet.tstapp-subnet1.id}"
}

resource "aws_efs_mount_target" "moodle-mnt-target-subnet2" {
  file_system_id = aws_efs_file_system.moodle-efs.id
  subnet_id = "${aws_subnet.tstapp-subnet2.id}"
}