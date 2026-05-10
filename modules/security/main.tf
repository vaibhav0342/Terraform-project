#################################
# CloudFront Managed Prefix List
#################################

data "aws_ec2_managed_prefix_list" "cloudfront" {
  name = "com.amazonaws.global.cloudfront.origin-facing"
}

#################################
# ALB Security Group
#################################

resource "aws_security_group" "alb_sg" {

  name        = "${var.project}-alb-sg"
  description = "Private ALB Security Group"
  vpc_id      = var.vpc_id

  #################################
  # HTTP From CloudFront ONLY
  #################################

  ingress {

    description = "HTTP from CloudFront"

    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    prefix_list_ids = [
      data.aws_ec2_managed_prefix_list.cloudfront.id
    ]
  }

  #################################
  # Outbound
  #################################

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-alb-sg"
  }
}


#################################
# Jenkins Security Group
#################################

resource "aws_security_group" "jenkins_sg" {

  name        = "${var.project}-jenkins-sg"
  description = "Jenkins Security Group"
  vpc_id      = var.vpc_id

  #################################
  # Jenkins ONLY from ALB
  #################################

  ingress {

    description = "Jenkins from ALB"

    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"

    security_groups = [
      aws_security_group.alb_sg.id
    ]
  }

  #################################
  # Outbound
  #################################

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-jenkins-sg"
  }
}