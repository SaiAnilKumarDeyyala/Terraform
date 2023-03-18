variable "resource_group_name" {
  type      = string 
}  

variable "storage_account_name" {
    type    = string
}

variable "account_tier" {
    type    = string
}

variable "account_replication_type" {
    type    = string
}

variable "tags" {
    type    = map(string)
}

variable "storage_container_name" {
    type    = string
}

variable "container_access_type" {
    type    = string
}





