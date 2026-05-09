resource "aws_instance" "web" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id

  vpc_security_group_ids = var.security_group_ids

  iam_instance_profile   = var.instance_profile_name

  associate_public_ip_address = true
  monitoring                  = true

  #################################
  # User Data
  #################################
  user_data = file("${path.module}/userdata.sh")

  # Re-run userdata when changed
  user_data_replace_on_change = true

  #################################
  # Root Volume
  #################################
  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }

  #################################
  # Metadata Security
  #################################
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  #################################
  # Tags
  #################################
  tags = merge(
    {
      Name = "jenkins-server"
    },
    var.tags
  )
}