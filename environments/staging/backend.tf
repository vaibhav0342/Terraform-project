terraform {
  backend "s3" {
    bucket         = "tf-state-bucket-staging-env"
    key            = "dev/ec2/terraform.tfstate"
    region         = "us-east-1"
  }
}
