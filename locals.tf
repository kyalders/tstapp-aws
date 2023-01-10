locals {
    AWS_ACCESS_KEY_ID = lookup(var.AWS_ACCESS_KEY_ID, terraform.workspace)
    AWS_SECRET_ACCESS_KEY = lookup(var.AWS_SECRET_ACCESS_KEY, terraform.workspace)
    MYSQL_MODDLE_PW = lookup(var.MYSQL_MODDLE_PW, terraform.workspace)
}