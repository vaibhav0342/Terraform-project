terraform {
  backend "s3" {
    bucket         = "tf-state-bucket-prod-env"
    key            = "staging/ec2/terraform.tfstate"
    region         = "us-east-1"
  }
}
