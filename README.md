
# Azure Monitor → Teams Notifications

Deploy an Action Group that posts alerts to a Teams channel via an **Incoming Webhook**.

```bash
az deployment sub create -l uksouth -f bicep/actionGroupTeams.bicep -p groupName=ag-teams webhookUri=<secret>
```
