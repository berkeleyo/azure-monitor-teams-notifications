param(
  [Parameter(Mandatory)][string]$LogicAppUrl
)
Invoke-RestMethod -Method Post -Uri $LogicAppUrl -Body (Get-Content "$PSScriptRoot\..\samples\test-alert.json" -Raw) -ContentType "application/json"
