module "vpc" {
  source     = "../../modules/vpc"
  project    = "terraform-project"
  aws_region = var.aws_region
}

module "ssm" {
  source  = "../../modules/ssm"
  project = "terraform-project"
}

module "security" {
  source  = "../../modules/security"

  project = "terraform-project"
  vpc_id  = module.vpc.vpc_id
}
module "ec2" {
  source = "../../modules/ec2"

  ami                   = var.ami
  instance_type         = var.instance_type

  subnet_id = module.vpc.private_subnet_ids[0]

  security_group_ids = [
    module.security.security_group_id
  ]

  instance_profile_name = module.ssm.instance_profile_name

  tags = {
    Environment = var.environment
  }
}

module "alb" {

  source = "../../modules/alb"

  project = "terraform-project"

  vpc_id = module.vpc.vpc_id

  instance_id = module.ec2.instance_id

  private_subnet_ids = module.vpc.private_subnet_ids

  alb_security_group_id = module.security.alb_security_group_id
}

module "cloudfront" {

  source = "../../modules/cloudfront"

  alb_dns_name = module.alb.alb_dns_name

  alb_arn = module.alb.alb_arn
}