param(
  [Parameter(Mandatory)][string]$ResourceGroup,
  [Parameter(Mandatory)][string]$Location,
  [Parameter(Mandatory)][string]$WorkflowName,
  [Parameter(Mandatory)][string]$TeamsWebhookUrl
)
# Deploy a consumption Logic App with an HTTP trigger and POST to Teams webhook
$tempFile = New-TemporaryFile
(Get-Content "$PSScriptRoot\..\logicapps\alert-to-teams.workflow.json" -Raw) | Set-Content $tempFile -Encoding UTF8

# Create Logic App
az logic workflow create `
  -g $ResourceGroup `
  -n $WorkflowName `
  -l $Location `
  --definition @$tempFile `
  --parameters "{\"teamsWebhookUrl\":{\"value\":\"$TeamsWebhookUrl\"}}"

Write-Host "Logic App '$WorkflowName' deployed in RG '$ResourceGroup'."
Write-Host "To wire up Azure Monitor, add this Logic App as an action via 'Webhook' or use Action Group + Logic App."
