# Azure Resource Group variables #

variable "rg_name" {
  description = "Name of the resource group."
}

variable "rg_location" {
  description = "Location of the resource group."
}

# Azure Key Vault variables #

variable "vault_name" {
  type        = string
  description = "The name of the Azure Key Vault"
  default = "trackerapp-vault"
}

variable "sku_name" {
  type        = string
  description = "Select Standard or Premium SKU"
  default     = "standard"
}

variable "enabled_for_deployment" {
  type        = string
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = "true"
}

variable "enabled_for_disk_encryption" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default     = "true"
}

variable "enabled_for_template_deployment" {
  type        = string
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = "true"
}

variable "secret_maps" {
  description = "Secrets added to key vault."
}

variable "enable_rbac_authorization" {
  description = "Allow rbac authorization."
  default = true
}

variable "soft_delete_retention_days" {
  description = "Retention days for soft_delete."
  default = 7
}

variable "purge_protection_enabled" {
  description = "Allow purge protection."
  default = false
}


