az storage account create --name $(terraformstorageaccount) --resource-group $(terraformstoragerg) --location eastus --sku Standard_LRS

az storage container create --name tfstate --account-name $(terraformstorageaccount)

az storage account keys list -g $(terraformstoragerg) -n $(terraformstorageaccount)

$key=(Get-AzureRmStorageAccountKey -ResourceGroupName $(terraformstoragerg) -AccountName $(terraformstorageaccount)).Value[0]

Write-host "##vso[task.setvariable variable=storagekey]$key"