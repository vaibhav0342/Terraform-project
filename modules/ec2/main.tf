resource "aws_instance" "web" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id

  vpc_security_group_ids = var.security_group_ids

  iam_instance_profile   = var.instance_profile_name

  associate_public_ip_address = true
  monitoring                  = true

  user_data = file("${path.module}/userdata.sh")

  tags = merge(
    {
      Name = "jenkins-server"
    },
    var.tags
  )
}