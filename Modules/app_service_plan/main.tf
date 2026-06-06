data "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
}

resource "azurerm_app_service_plan" "app_service_plan" {
    name                = var.app_service_plan_name
    location            = azurerm_resource_group.resource_group.location
    resource_group_name = azurerm_resource_group.resource_group.name
    sku {
        tier = var.app_service_plan_sku_tier
        size = var.app_service_plan_sku_size
    }
}