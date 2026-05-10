output "alb_dns_name" {
  value = aws_lb.jenkins_alb.dns_name
}

output "alb_zone_id" {
  value = aws_lb.jenkins_alb.zone_id
}