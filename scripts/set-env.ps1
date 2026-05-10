param(
    [string]$Environment = "dev"
)

$env:TF_VAR_environment = $Environment

Write-Host "Environment set to: $Environment"
