# External DNS
## Azure Configuration
Guide is found [here](https://github.com/kubernetes-sigs/external-dns/blob/master/docs/tutorials/azure.md). 
Create configuration file in this format.
``` json
{
  "tenantId": "01234abc-de56-ff78-abc1-234567890def",
  "subscriptionId": "01234abc-de56-ff78-abc1-234567890def",
  "resourceGroup": "MyDnsResourceGroup",
  "aadClientId": "01234abc-de56-ff78-abc1-234567890def",
  "aadClientSecret": "uKiuXeiwui4jo9quae9o"
}

```
- get tenant id: `az account show --query "tenantId"`: c04e3789-3880-4e6e-a01c-28b66b6c4948
- get subscription id: `az account show --query "id"`: 10589681-5ffc-4c04-bc50-3f3b976aaea9
- get resource group: temmie-rg