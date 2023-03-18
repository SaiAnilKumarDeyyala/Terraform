output "vnet_name" {
  value = azurerm_virtual_network.vnet.name 
}
output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "subnet_name" {
  value = element(azurerm_virtual_network.vnet.subnet.*.name, 0)
}

output "subnet_id" {
  value = element(azurerm_virtual_network.vnet.subnet.*.id, 0)
}

output "subnettwo_name" {
    value = element(azurerm_virtual_network.vnet.subnet.*.name, 1) 
}

output "subnettwo_id" {
  value = element(azurerm_virtual_network.vnet.subnet.*.id, 1)
}
