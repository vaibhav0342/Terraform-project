param(
    [string]$Environment = "dev"
)

Write-Host "================================="
Write-Host " Terraform Plan: $Environment"
Write-Host "================================="

Set-Location "$PSScriptRoot/../environments/$Environment"

terraform init
terraform plan -out=tfplan
terraform show tfplan
