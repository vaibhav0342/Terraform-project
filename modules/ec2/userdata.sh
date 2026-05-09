#!/bin/bash

set -euxo pipefail

########################################
# System Update
########################################
yum update -y

########################################
# Install Docker
########################################
yum install -y docker

systemctl enable docker
systemctl start docker

usermod -aG docker ec2-user

########################################
# Install Java 17
########################################
yum install -y java-17-amazon-corretto

########################################
# Install Jenkins
########################################
wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

yum install -y jenkins

systemctl enable jenkins
systemctl start jenkins

########################################
# Install Git
########################################
yum install -y git

########################################
# Install Terraform
########################################
yum install -y yum-utils

yum-config-manager --add-repo \
https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

yum install -y terraform

########################################
# Install kubectl
########################################
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

chmod +x kubectl
mv kubectl /usr/local/bin/

########################################
# Install AWS CLI
########################################
yum install -y aws-cli

########################################
# Verify Services
########################################
systemctl status docker --no-pager
systemctl status jenkins --no-pager

echo "================================="
echo " Jenkins installation completed "
echo "================================="