param groupName string
resource ag 'Microsoft.Insights/actionGroups@2022-06-15' = {
  name: groupName
  location: 'global'
  properties: {
    groupShortName: groupName
    enabled: true
    armRoleReceivers: []
  }
}
