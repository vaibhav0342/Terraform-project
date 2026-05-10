variable "project" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "instance_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "alb_security_group_id" {
  type = string
}
