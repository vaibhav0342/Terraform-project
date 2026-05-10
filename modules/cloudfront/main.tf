resource "aws_cloudfront_vpc_origin" "jenkins" {

  vpc_origin_endpoint_config {

    name = "jenkins-vpc-origin"

    arn = var.alb_arn

    http_port  = 80
    https_port = 443

    origin_protocol_policy = "http-only"

    origin_ssl_protocols = [
      "TLSv1.2"
    ]
  }

  tags = {
    Name = "jenkins-vpc-origin"
  }
}
resource "aws_cloudfront_distribution" "jenkins_cf" {

  enabled = true

  origin {

    domain_name = var.alb_dns_name

    origin_id = "jenkins-alb"

    vpc_origin_config {

      vpc_origin_id = aws_cloudfront_vpc_origin.jenkins.id
    }
  }

  default_cache_behavior {

    target_origin_id = "jenkins-alb"

    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = [
      "GET",
      "HEAD",
      "OPTIONS",
      "PUT",
      "POST",
      "PATCH",
      "DELETE"
    ]

    cached_methods = [
      "GET",
      "HEAD"
    ]

    forwarded_values {

      query_string = true

      cookies {
        forward = "all"
      }
    }
  }

  restrictions {

    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}