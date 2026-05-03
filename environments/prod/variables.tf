variable "ami" {
  description = "EC2 AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "subnet_id" {
  description = "vpc subnet id"
  type = string
}

variable "security_group_ids" {
  description = "AWS security group"
  type = list(string)
}

variable "environment" {
  type = string
}