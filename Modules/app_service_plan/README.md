
# App Service Plan Terraform Module

## Version
`v1.0.0`

## Overview
This module creates an Azure App Service Plan with support for Windows, Linux, Function Apps, and Container deployments.

## Usage

```hcl
module "app_service_plan" {
    source = "./modules/app_service_plan"

    name                = "api-appserviceplan-pro"
    resource_group_name = azurerm_resource_group.example.name
    location            = azurerm_resource_group.example.location
    kind                = "Windows"
    
    sku = {
        tier     = "Standard"
        size     = "S1"
        capacity = 1
    }

    tags = {
        environment = "production"
    }
}
```

## Parameters

### Mandatory Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `name` | string | Name of the App Service Plan |
| `resource_group_name` | string | Resource group name |
| `location` | string | Azure location (e.g., "West Europe") |
| `sku` | object | SKU configuration with `tier` and `size` |

### Optional Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `kind` | string | "Windows" | Plan type: Windows, Linux, FunctionApp, elastic, xenon |
| `reserved` | bool | false | Required true for Linux plans |
| `is_xenon` | bool | false | Enable xenon plan |
| `zone_redundant` | bool | false | Enable zone redundancy (PremiumV2/V3 only) |
| `per_site_scaling` | bool | false | Allow independent app scaling |
| `maximum_elastic_worker_count` | number | null | Max workers for elastic plans |
| `app_service_environment_id` | string | null | ASE resource ID |
| `tags` | map(string) | {} | Resource tags |

## Outputs

- `id` - App Service Plan resource ID
