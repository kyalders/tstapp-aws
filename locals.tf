locals {
    AWS_ACCESS_KEY_ID = lookup(value,var.AWS_ACCESS_KEY_ID, terraform.workspace)
    AWS_SECRET_ACCESS_KEY = lookup(value, var.AWS_SECRET_ACCESS_KEY, terraform.workspace)
    MYSQL_MODDLE_PW = lookup(value, var.MYSQL_MODDLE_PW, terraform.workspace)
}