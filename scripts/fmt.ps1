Write-Host "================================="
Write-Host " Formatting Terraform"
Write-Host "================================="

Set-Location "$PSScriptRoot/../"

terraform fmt -recursive
