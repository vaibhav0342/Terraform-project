variable "project" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "allowed_ssh_cidr" {
  type = list(string)
}

variable "allowed_jenkins_cidr" {
  type = list(string)
}

variable "tags" {
  type    = map(string)
  default = {}
}