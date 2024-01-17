variable "vpc_cidr" {
  default = "10.10.0.0/16"
}

variable "public_sub_cidrs" {
  type = list(string)
  default = [
    "10.10.1.0/24",
    "10.10.2.0/24"
  ]
}

variable "private_sub_cidrs" {
  type = list(string)
  default = [
    "10.10.11.0/24",
    "10.10.22.0/24"
  ]
}

variable "open_ports" {
  default = [
    "80",
    "443",
    "22"
  ]
}

variable "ec2_instance_type" {
  default = "t2.micro"
}

variable "enviroment" {
  default = "dev"
}

variable "rds_user" {
#  description = "export TF_VARS_rds_user=<user>"
}

variable "rds_password" {
#  description = "export TF_VARS_rds_password=<password>"
}

variable "class_db" {
  default = "db.t3.micro"
}

variable "engine_db" {
  default = "postgres"
}

variable "rds_az" {
  default = "eu-central-1a"
}