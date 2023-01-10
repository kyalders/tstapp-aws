locals {
    AWS_ACCESS_KEY_ID = lookup(env.AWS_ACCESS_KEY_ID, terraform.workspace)
    AWS_SECRET_ACCESS_KEY = lookup(env.AWS_SECRET_ACCESS_KEY, terraform.workspace)
    MYSQL_MODDLE_PW = lookup(env.MYSQL_MODDLE_PW, terraform.workspace)
}