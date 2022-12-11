/* # secret to store the password
resource "aws_secretsmanager_secret" "db-pass" {
  name = "db-pass-${random_id.id.hex}"
}

# initial value
resource "aws_secretsmanager_secret_version" "db-pass-val" {
  secret_id = aws_secretsmanager_secret.db-pass.id
  secret_string = jsonencode(
    {
      username = aws_db_instance.my_test_mysql.username
      password = aws_db_instance.my_test_mysql.password
      engine   = "mysql"
      host     = aws_db_instance.my_test_mysql.endpoint
    }
  )
}
*/
