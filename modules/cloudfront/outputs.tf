output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.jenkins_cf.domain_name
}