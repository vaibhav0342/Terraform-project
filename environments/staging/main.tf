module "ec2" {
  source = "../../modules/ec2"

  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  instance_profile_name  = module.ssm.instance_profile_name

  tags = {
    Environment = var.environment
    Project     = "terraform-project"
  }
}

module "ssm" {
  source  = "../../modules/ssm"
  project = "terraform-project"
}
