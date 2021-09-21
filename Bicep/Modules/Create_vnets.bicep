
//parameters
param vnetname string
param addressspace string
param subnet_address array
param dnsservers array 
param subnet_names array 



resource virtualNetwork 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: vnetname
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressspace
      ]
    }
    dhcpOptions:{
      dnsServers:dnsservers
    
    }
    subnets: [
      {
        name: subnet_names[0]
        properties: {
          addressPrefix: subnet_address[0]
          serviceEndpoints:[
            {
              service:'Microsoft.Storage'
            }
          ]
        }
      }
      {
        name: subnet_names[1]
        properties: {
          addressPrefix: subnet_address[1]
          serviceEndpoints:[
            {
              service:'Microsoft.Storage'
            }
          ]
        }
      }
      {
        name: subnet_names[2]
        properties: {
          addressPrefix: subnet_address[2]
          serviceEndpoints:[
            {
              service:'Microsoft.Storage'
            }
          ]
        }
      }
    ]   
  }
}


output virtualnetwork_output array = virtualNetwork.properties.addressSpace.addressPrefixes 





