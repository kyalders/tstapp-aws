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

resource "aws_efs_file_system_policy" "efs-policy" {
  file_system_id = aws_efs_file_system.moodle-efs.id
# The EFS System Policy allows clients to mount, read and perform 
# write operations on File system 
# The communication of client and EFS is set using aws:secureTransport Option
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "Policy01",
    "Statement": [
        {
            "Sid": "Statement",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Resource": "${aws_efs_file_system.moodle-efs.arn}",
            "Action": [
                "elasticfilesystem:ClientMount",
                "elasticfilesystem:ClientRootAccess",
                "elasticfilesystem:ClientWrite"
            ],
            "Condition": {
                "Bool": {
                    "aws:SecureTransport": "false"
                }
            }
        }
    ]
}
POLICY
}