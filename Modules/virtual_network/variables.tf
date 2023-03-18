variable "resource_group_name" {
  type      = string
}

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

variable "tags" {
  type = map(string)
}
