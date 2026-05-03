terraform {
  backend \"s3\" {
    bucket         = \"tf-state-bucket-prod\"
    key            = \"prod/ec2/terraform.tfstate\"
    region         = \"ap-south-1\"
    dynamodb_table = \"tf-locks\"
    encrypt        = true
  }
}
