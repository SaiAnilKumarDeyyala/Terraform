# resource group
variable "resource_group_name" {
  type = string
}

# storage account
variable "storage_account_name" {
  type = string
}

variable "account_tier" {
  type = string
}

variable "account_replication_type" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "account_kind" {
  type    = string
  default = "StorageV2"
}

variable "cross_tenant_replication_enabled" {
  type    = bool
  default = false
}

variable "provisioned_billing_model_version" {
  type    = string
  default = null
}

variable "access_tier" {
  type    = string
  default = "Hot"
}

variable "edge_zone" {
  type    = string
  default = null
}

variable "https_traffic_only_enabled" {
  type    = bool
  default = true
}

variable "min_tls_version" {
  type    = string
  default = "TLS1_2"
}

variable "allow_nested_items_to_be_public" {
  type    = bool
  default = true
}

variable "shared_access_key_enabled" {
  type    = bool
  default = true
}

variable "public_network_access_enabled" {
  type    = bool
  default = true
}

variable "default_to_oauth_authentication" {
  type    = bool
  default = false
}

variable "is_hns_enabled" {
  type    = bool
  default = false
}

variable "nfsv3_enabled" {
  type    = bool
  default = false
}

variable "custom_domain" {
  type    = any
  default = null
}

variable "customer_managed_key" {
  type    = any
  default = null
}

variable "identity" {
  type    = any
  default = null
}

variable "blob_properties" {
  type    = any
  default = null
}

variable "queue_properties" {
  type    = any
  default = null
}

variable "static_website" {
  type    = any
  default = null
}

variable "share_properties" {
  type    = any
  default = null
}

variable "network_rules" {
  type    = any
  default = null
}

variable "large_file_share_enabled" {
  type    = bool
  default = false
}

variable "local_user_enabled" {
  type    = bool
  default = true
}

variable "azure_files_authentication" {
  type    = any
  default = null
}

variable "routing" {
  type    = any
  default = null
}

variable "queue_encryption_key_type" {
  type    = string
  default = "Service"
}

variable "table_encryption_key_type" {
  type    = string
  default = "Service"
}

variable "infrastructure_encryption_enabled" {
  type    = bool
  default = false
}

variable "immutability_policy" {
  type    = any
  default = null
}

variable "sas_policy" {
  type    = any
  default = null
}

variable "allowed_copy_scope" {
  type    = string
  default = null
}

variable "sftp_enabled" {
  type    = bool
  default = false
}

variable "dns_endpoint_type" {
  type    = string
  default = "Standard"
}




