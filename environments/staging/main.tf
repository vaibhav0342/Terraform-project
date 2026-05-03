module "ec2" {
  source = "../../modules/ec2"

  ami           = "ami-091138d0f0d41ff90" # update per region
  instance_type = "t3.micro"
}
