variable "resource_group_name" {
  type      = string 
}  

variable "tags" {
  type = map(string)
}

# STORAGE_ACCOUNT
variable "storage_account_name" {
    type    = string
}

variable "account_tier" {
    type    = string
}

variable "account_replication_type" {
    type    = string
}

variable "storage_container_name" {
    type    = string
}

variable "container_access_type" {
    type    = string
}

# VIRTUAL_NETWORK
variable "vnet_name" {
  type = string
}

variable "nsg_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "subnettwo_name" {
  type = string
}






