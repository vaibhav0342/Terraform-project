terraform {
  backend "s3" {
    bucket         = "tf-state-bucket-prod"
    key            = "staging/ec2/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "tf-locks"
    encrypt        = true
  }
}
