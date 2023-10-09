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
  "aadClientSecret": "uKiuXeiwui4jo9quae9o" # 
}

```
- the config is saved as azure.json
- a service principal is created as granted permissions to the resource group and public dns zone
- the config is mounted as a volume on external dns
- once hosts are supplied in an ingress, external dns can add the host automatically to the public dns zone with the service principal