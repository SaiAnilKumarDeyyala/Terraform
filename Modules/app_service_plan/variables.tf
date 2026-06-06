# resource group 
variable "resource_group_name" {
  description = "The name of the resource group in which to create the app service plan and app service."
  type        = string
}

# app service plan
variable "app_service_plan_name" {
    description = "The name of the app service plan"
    type        = string
}

variable "app_service_plan_sku_tier" {
    description = "The SKU tier of the app service plan"
    type        = string
}

variable "app_service_plan_sku_size" {
    description = "The SKU size of the app service plan"
    type        = string
}