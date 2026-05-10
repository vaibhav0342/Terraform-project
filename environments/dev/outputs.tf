output "instance_id" {
  value = module.ec2.instance_id
}

output "security_group_id" {
  description = "Security Group ID"
  value       = module.security.security_group_id
}