param(
    [string]$Environment = "dev"
)

Write-Host "================================="
Write-Host " Validating Terraform"
Write-Host "================================="

Set-Location "$PSScriptRoot/../environments/$Environment"

terraform fmt -recursive
terraform validate
