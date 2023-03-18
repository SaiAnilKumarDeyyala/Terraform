#common
resource_group_name     = "Devops-RG"
tags                    = {
                            "created_by" = "Sai Anil"
                            "Environment" = "dev"
                        }

#STORAGE_ACCOUNT
storage_account_name    = "terraformtrdsdsvgr"
account_tier            = "Standard" 
account_replication_type= "LRS"
storage_container_name  = "terraform-poc-container"
container_access_type   = "private"

# VIRTUAL_NETWORK
vnet_name               = "tfm-dev-vnett"
nsg_name                = "tfm001-dev-nsg"
subnet_name             = "tfm-nsg-dev-snett"
subnettwo_name          = "tfm-nsg-dev-snet2"

