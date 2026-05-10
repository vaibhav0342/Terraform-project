param(
    [string]$Environment = "dev"
)

Write-Host "================================="
Write-Host " Terraform Apply: $Environment"
Write-Host "================================="

Set-Location "$PSScriptRoot/../environments/$Environment"

terraform apply -auto-approve
