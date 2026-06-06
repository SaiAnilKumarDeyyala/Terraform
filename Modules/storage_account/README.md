# Storage Account Terraform Module

## Version
`v1.0.0`

## Overview
This module provisions an Azure Storage Account using the `azurerm_storage_account` resource. It exposes a small, focused set of inputs (name, tier, replication, tags) and uses the provided resource group for location and grouping.

## Usage

Basic example:

```hcl
module "storage_account" {
	source                   = "./Modules/storage_account"
	resource_group_name      = azurerm_resource_group.example.name
	storage_account_name     = "mystorageacct001"
	account_tier             = "Standard"
	account_replication_type = "LRS"
	tags = {
		environment = "staging"
	}
}
```

Example with network rules (this module does not currently expose network rules — see "Extending the module" below):

```hcl
# create network resources and then add network rules to the storage account resource
```

## Parameters

### Mandatory Parameters

The module currently requires the following inputs:

- `resource_group_name` (string): The name of the Resource Group in which to create the Storage Account. The module reads the resource group's location and uses it for the storage account.
- `storage_account_name` (string): The name of the Storage Account. Must follow Azure naming rules (lowercase alphanumeric, unique across Azure).
- `account_tier` (string): The account tier, e.g. `Standard` or `Premium`.
- `account_replication_type` (string): The replication type, e.g. `LRS`, `GRS`, `RAGRS`, `ZRS`, `GZRS`, `RAGZRS`.

### Optional Parameters

- `tags` (map(string)): Tags to assign to the Storage Account. Defaults to an empty map if not provided by the root module.

Note: The azurerm provider supports many additional settings (network_rules, account_kind, access_tier, is_hns_enabled, customer_managed_key, static_website, etc.). This module intentionally exposes a minimal surface. To use additional features, add a corresponding variable to `variables.tf` and wire it into `main.tf`.

Below is a more complete list of `azurerm_storage_account` arguments you may want to expose if you extend this module. The table indicates whether each parameter is Required and the typical default value (provider default where shown).

| Parameter | Required | Type | Default | Description |
|---|:---:|---:|---|---|
| `account_kind` | No | string | `StorageV2` | Kind of account: BlobStorage, BlockBlobStorage, FileStorage, Storage, StorageV2 |
| `provisioned_billing_model_version` | No | string | `null` | Provisioned billing model version (e.g. `V2`) |
| `cross_tenant_replication_enabled` | No | bool | `false` | Enable cross-tenant replication |
| `access_tier` | No | string | `Hot` | Access tier: Hot, Cool, Cold, Smart, Premium |
| `edge_zone` | No | string | `null` | Edge Zone for the storage account (forces new resource) |
| `https_traffic_only_enabled` | No | bool | `true` | Force HTTPS traffic only |
| `min_tls_version` | No | string | `TLS1_2` | Minimum TLS version: TLS1_0, TLS1_1, TLS1_2 |
| `allow_nested_items_to_be_public` | No | bool | `true` | Allow nested items to be public |
| `shared_access_key_enabled` | No | bool | `true` | Allow Shared Key auth (required by Terraform for some data-plane ops) |
| `public_network_access_enabled` | No | bool | `true` | Enable public network access |
| `default_to_oauth_authentication` | No | bool | `false` | Default to Azure AD auth in the Azure portal |
| `is_hns_enabled` | No | bool | `false` | Hierarchical namespace (ADLS Gen2) - forces new when changed |
| `nfsv3_enabled` | No | bool | `false` | Enable NFSv3 (requires specific kinds/tiers) |
| `custom_domain` | No | block | `null` | Custom domain block: `name`, `use_subdomain` |
| `customer_managed_key` | No | block | `null` | CMK block: `key_vault_key_id`, `user_assigned_identity_id` |
| `identity` | No | block | `null` | Managed identity block: `type`, `identity_ids` |
| `blob_properties` | No | block | `null` | Blob service properties (versioning, change_feed, etc.) |
| `queue_properties` | No | block | `null` | Queue service properties |
| `static_website` | No | block | `null` | Static website settings (index_document, error_404_document) |
| `share_properties` | No | block | `null` | File share properties (SMB settings, retention) |
| `network_rules` | No | block | `null` | Network rules: `default_action`, `ip_rules`, `virtual_network_subnet_ids` |
| `large_file_share_enabled` | No | bool | `false` | Enable large file shares |
| `local_user_enabled` | No | bool | `true` | Enable local users for SFTP |
| `azure_files_authentication` | No | block | `null` | Azure Files authentication settings (directory_type, active_directory) |
| `routing` | No | block | `{ choice = "MicrosoftRouting" }` | Network routing options for the account |
| `queue_encryption_key_type` | No | string | `Service` | Encryption type for queue service: Service or Account |
| `table_encryption_key_type` | No | string | `Service` | Encryption type for table service: Service or Account |
| `infrastructure_encryption_enabled` | No | bool | `false` | Enable infrastructure encryption |
| `immutability_policy` | No | block | `null` | Immutability policy block (allow_protected_append_writes, state, period_since_creation_in_days) |
| `sas_policy` | No | block | `null` | SAS policy block (expiration_period, expiration_action) |
| `allowed_copy_scope` | No | string | `null` | Permitted scope for copy operations: AAD, PrivateLink, All |
| `sftp_enabled` | No | bool | `false` | Enable SFTP (requires is_hns_enabled = true) |
| `dns_endpoint_type` | No | string | `Standard` | DNS endpoint type: Standard or AzureDnsZone |
| `tags` | No | map(string) | `{}` | Tags to assign to the resource |

Notes:

- The provider also has a number of required arguments; the module currently exposes the required inputs at the top of this README: `resource_group_name` (Required), `storage_account_name` (Required), `account_tier` (Required) and `account_replication_type` (Required).
- Many of these attributes are interdependent (for example `is_hns_enabled`, `nfsv3_enabled`, `account_kind`, and `account_tier`). Refer to the `azurerm` provider docs for constraints before exposing them in the module.
- Where the default is shown as `null` it means the provider will use its internal default unless you explicitly pass a value.
- If you plan to export keys/connection strings, prefer storing them in Key Vault rather than adding module outputs for secrets.

## Outputs

The module exports commonly-used, non-sensitive attributes for downstream modules and consumers:

- `resource_group_name` - Name of the resource group used by the module.
- `storage_account_name` - The storage account name.
- `id` - The Azure resource ID of the storage account.
- `primary_blob_endpoint` - Primary blob endpoint URL (non-secret).
- `primary_location` - The primary location of the storage account.

Sensitive attributes such as the storage account keys and connection strings are intentionally not exported by this module. Those values are secrets and should be retrieved and stored securely (for example, placed in Key Vault or accessed via CI/CD secrets) rather than printed as module outputs.

## Extending the module

If you need to support additional `azurerm_storage_account` arguments (for example `network_rules`, `customer_managed_key`, `static_website`, or `identity`), add new variables to `variables.tf` and reference them in `main.tf` on the `azurerm_storage_account` resource. Follow existing module patterns for defaults and validations.

## Notes

- Follow Azure naming rules for `storage_account_name` (lowercase alphanumeric, length limits apply).
- This module provisions only the Storage Account resource. It does not create containers, blobs, file shares, or other data-plane resources — those should be created by downstream modules or separate resources (for example `azurerm_storage_container`).
- Changing certain properties (like `account_tier`, `account_replication_type`, or `account_kind`) can force replacement of the storage account.
- If you disable shared key access in advanced scenarios, Terraform operations that rely on shared keys (creating containers, etc.) may require enabling `storage_use_azuread` in the provider and additional permissions.

### Secrets and endpoints

- `primary_blob_endpoint` is safe to export (it's a URL). Account keys and connection strings are sensitive and were removed from the module outputs.
- If you need programmatic access to keys or connection strings, consider using:
	- Azure Key Vault to store keys and grant downstream services access, or
	- A dedicated automation step (Azure CLI / REST API) that fetches the secret at runtime and injects it into a secure place (CI/CD secret store), instead of exposing it as a Terraform output.

## Example

See the root-level examples in the repository for how this module is consumed.
