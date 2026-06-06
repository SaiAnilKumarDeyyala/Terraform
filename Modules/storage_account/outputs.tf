# resource group 
output "resource_group_name" {
  value = data.azurerm_resource_group.resource_group.name
}

# storage account
output "storage_account_name" {
  value = azurerm_storage_account.storage_account.name
}

output "id" {
  description = "The resource ID of the storage account"
  value       = azurerm_storage_account.storage_account.id
}

output "primary_blob_endpoint" {
  description = "Primary blob endpoint URL"
  value       = azurerm_storage_account.storage_account.primary_blob_endpoint
}

output "primary_location" {
  description = "Primary location of the storage account"
  value       = azurerm_storage_account.storage_account.primary_location
}