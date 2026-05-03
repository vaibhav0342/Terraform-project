terraform {
  backend \"s3\" {
    bucket         = \"tf-state-bucket-dev-env\"
    key            = \"dev/ec2/terraform.tfstate\"
    region         = \"ap-south-1\"
  }
}
