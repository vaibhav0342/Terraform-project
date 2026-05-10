param(
    [string]$Environment = "dev"
)

Write-Host "================================="
Write-Host " Initializing Terraform"
Write-Host "================================="

Set-Location "$PSScriptRoot/../environments/$Environment"

terraform init
