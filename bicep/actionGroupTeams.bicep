
param groupName string
@description('Webhook endpoint (e.g., Teams incoming webhook).')
param webhookUri string

resource ag 'Microsoft.Insights/actionGroups@2022-06-15' = {
  name: groupName
  location: 'global'
  properties: {
    groupShortName: groupName
    enabled: true
    webHookReceivers: [
      {
        name: 'teams'
        serviceUri: webhookUri
        useCommonAlertSchema: true
      }
    ]
  }
}
