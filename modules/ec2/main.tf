resource "aws_instance" "web" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  iam_instance_profile = var.instance_profile_name
  associate_public_ip_address = true
  monitoring                  = true

  tags = merge(
    {
      Name = "jenkins-server"
    },
    var.tags
  )
}