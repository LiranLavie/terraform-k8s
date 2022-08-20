# Resources Group Variables
variable "rg_name" {
  description = "Name of the resource group."
}

variable "shared_rg_name" {
  description = "Name of the resource group."
}

variable "rg_location" {
  description = "location of the resource group."
}

# AKS Variables
variable "node_count" {
  description = "Number of nodes in the cluster."
}

variable "staging_cluster_name" {
  description = "staging_cluster_name"
}

variable "production_cluster_name" {
  description = "production_cluster_name"
}

# ACR Variables
variable "app_name" {
  description = "name of the webapp."
}

variable "acr_sku" {
  type        = string
  description = "Select Standard or Premium SKU"
  default     = "Standard"
}


variable "acr_admin_enabled" {
  description = "allow admin"
}

# Vault Variables
variable "secret_maps" {
  description = "Secrets added to key vault."
}




