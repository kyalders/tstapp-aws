locals = {
    AWS_ACCESS_KEY_ID = lookup(var.access_key, terraform.workspace)
    AWS_SECRET_ACCESS_KEY = lookup(var.secret_access, terraform.workspace)
    MYSQL_MODDLE_PW = lookup(var.mysql_moodle_pw, terraform.workspace)
}