module "ssm" {
  source  = "../../modules/ssm"
  project = "terraform-project"
}

module "security" {
  source = "../../modules/security"

  project              = "terraform-project"
  vpc_id               = var.vpc_id

  allowed_ssh_cidr     = ["0.0.0.0/0"]
  allowed_jenkins_cidr = ["0.0.0.0/0"]

  tags = {
    Environment = var.environment
    Project     = "terraform-project"
  }
}

module "ec2" {
  source = "../../modules/ec2"

  ami                   = var.ami
  instance_type         = var.instance_type
  subnet_id             = var.subnet_id

  security_group_ids = [module.security.security_group_id]

  instance_profile_name = module.ssm.instance_profile_name

  tags = {
    Environment = var.environment
    Project     = "terraform-project"
  }
}