output "resource_group_name" {
  value = data.azurerm_resource_group.resource_group.name
}

output "storage_account_name" {
  value = azurerm_storage_account.storage_account.name
}

output "storage_container_name" {
  value = azurerm_storage_container.storage_container.name
}

output "location" {
  value = data.azurerm_resource_group.resource_group.location
}

output "account_tier" {
  value = azurerm_storage_account.storage_account.account_tier
}

output "account_replication_type" {
  value = azurerm_storage_account.storage_account.account_replication_type
}

output "container_access_type" {
  value = azurerm_storage_container.storage_container.container_access_type
}
