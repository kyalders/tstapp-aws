resource "null_resource" "db_setup" {
  triggers = {
    file = filesha1("moodle_setup.sql")
  }
  provisioner "local-exec" {
    command = <<-EOF
			while read line; do
				echo "$line"
				aws rds-data execute-statement --resource-arn "$DB_ARN" --database  "$DB_NAME" --secret-arn "$SECRET_ARN" --sql "$line"
			done  < <(awk 'BEGIN{RS=";\n"}{gsub(/\n/,""); if(NF>0) {print $0";"}}' initial.sql)
			EOF
    environment = {
      DB_ARN     = aws_db_instance.my_test_mysql.arn
      DB_NAME    = aws_db_instance.my_test_mysql.db_name
      SECRET_ARN = aws_secretsmanager_secret.db-pass.arn
    }
    interpreter = ["bash", "-c"]
  }
}