#!/bin/bash

set -e

sudo yum update -y

# Install Docker
sudo amazon-linux-extras install docker -y
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ec2-user

# Install Java
sudo yum install java-17-amazon-corretto -y

# Add Jenkins Repo
sudo wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Install Jenkins
sudo yum install jenkins -y

# Enable Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Install Git
sudo yum install git -y

# Install Terraform
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo \
https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

sudo yum -y install terraform

# Install kubectl
curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.29.0/2024-01-04/bin/linux/amd64/kubectl

chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Install AWS CLI
sudo yum install aws-cli -y

echo "Jenkins setup completed"