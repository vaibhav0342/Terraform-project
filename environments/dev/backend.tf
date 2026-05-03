terraform {
  backend "s3" {
    bucket         = "tf-state-bucket-prod-env"
    key            = "dev/ec2/terraform.tfstate"
    region         = "us-east-1"
  }
}
