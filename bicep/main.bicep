@description('Specifies the location for resources.')
param location string = 'westus3'

param appServiceAppName string = 'toy-product-launch-1-al'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: 'toylaunchstorageal'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

resource appServicePlan 'Microsoft.Web/serverfarms@2021-03-01' = {
  name: 'toy-product-launch-plan-starter'
  location: location
  sku: {
    name: 'F1'
  }
}

resource appServiceApp 'Microsoft.Web/sites@2021-03-01' = {
  name: appServiceAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}
