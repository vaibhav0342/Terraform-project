terraform {
  backend "s3" {
    bucket         = "tf-state-bucket-staging-env"
    key            = "staging/ec2/terraform.tfstate"
    region         = "ap-south-1"
  }
}
