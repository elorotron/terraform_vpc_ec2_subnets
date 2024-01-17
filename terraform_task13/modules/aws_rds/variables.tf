variable "user" {}

variable "pass" {}

variable "class" {}

variable "engine" {}

variable "az" {}

variable "env" {}

variable "public_subnet_ids" {
  type = set(string)
}

variable "private_subnet_ids" {
  type = set(string)
}