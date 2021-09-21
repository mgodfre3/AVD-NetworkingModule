//Parameters
//Network Paramaters
param vnetname string ='ActivateWVD-Vnet'
param addressspace string = '10.10.0.0/24'
param subnet_address array =[
  '10.10.0.0/28'
  '10.10.0.16/28'
  '10.10.0.32/28'
]
param dnsservers array = [
  '10.20.200.40'
  '10.20.200.41'
]
param subnet_names array = [
  'avd-default'
  'avd-SHvalidation'
  'avd-SessionHost'
]


//Module Deployments
//Networking Module
module vnet 'Modules/Create_VNets.bicep'  = {
  name:'Create_Vnet'
  params: {
    vnetname: vnetname
    dnsservers : dnsservers
    addressspace: addressspace
    subnet_address: subnet_address
    subnet_names:subnet_names
}
}

