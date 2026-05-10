param(
    [string]$Environment = "dev"
)

Write-Host "================================="
Write-Host " Destroying Environment: $Environment"
Write-Host "================================="

Set-Location "$PSScriptRoot/../environments/$Environment"

terraform init
terraform destroy -auto-approve
