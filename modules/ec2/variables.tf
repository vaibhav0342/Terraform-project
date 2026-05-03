variable "ami" {}
variable "instance_type" {}

variable "tags" {
  type = map(string)
  default = {}
}

variable "subnet_id" {
  type = string
}


variable "instance_profile_name" {
  type = string
}
