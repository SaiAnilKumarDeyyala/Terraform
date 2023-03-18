data "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name 
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name 
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = var.subnet_name
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = var.subnettwo_name
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.nsg.id 
  }

  tags = var.tags 
}