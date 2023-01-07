# Defining Public Key
variable "public_key" {
  default = "tests.pub"
}
# Defining Private Key
variable "private_key" {
  default = "tests.pem"
}
# Definign Key Name for connection
variable "key_name" {
  default     = "tests"
  description = "Name of AWS key pair"
}
# Defining CIDR Block for VPC
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
# Defining CIDR Block for Subnet
variable "subnet1_cidr" {
  default = "10.0.1.0/24"
}
# Defining CIDR Block for 2d Subnet
variable "subnet2_cidr" {
  default = "10.0.2.0/24"
}

#Defining RDS PW Var
variable "rds_password" {
}

# Defining RDS Instance 
variable "db_instance" {
  default = "db.t3.micro"
}

#Data Template Vars
variable "moodledbhost" {
  default = "string"
}
variable "moodledbuser" {
  default = "string"
}
variable "moodledbpw" {
  default = "string"
}
variable "moodlealb" {
  default = "string"
}
variable "redis_endpoint"{
  default = "string"
}

