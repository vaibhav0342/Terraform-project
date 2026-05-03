module "ec2" {
  source = "../../modules/ec2"

  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  security_group_ids     = var.security_group_ids

  tags = {
    Environment = var.environment
    Project     = "terraform-project"
  }
}