module "storage_account" {
    source                  = "./Modules/storage_account"
    resource_group_name     = var.resource_group_name
    storage_account_name    = var.storage_account_name
    account_tier            = var.account_tier
    account_replication_type= var.account_replication_type
    tags                    = var.tags
    storage_container_name  = var.storage_container_name
    container_access_type   = var.container_access_type
}

module "virtual_network" {
    source                  = "./Modules/virtual_network"
    vnet_name               = var.vnet_name
    resource_group_name     = var.resource_group_name
    nsg_name                = var.nsg_name
    subnet_name             = var.subnet_name
    subnettwo_name          = var.subnettwo_name
    tags                    = var.tags
}