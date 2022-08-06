
variable "rg_name" {
  description = "Name of the resource group."
}

variable "rg_location" {
  description = "Location of the resource group."
}

variable "cluster_name" {
  description = "Name of the cluster."
}

variable "environment" {
  description = "Name of the environment."
}

variable "node_count" {
  description = "Number of nodes in the agent pool"
}

variable "http_application_routing_enabled" {
  description = "Allow http application routing"
  default = false
}

variable "role_based_access_control_enabled" {
  description = "Allow role based access control"
  default = true
}

variable "os_disk_size_gb" {
  description = "os disk size GB"
  default = 30
}

variable "vm_size_type" {
  description = "Vm size type"
  default = "Standard_D2_v2"
}

variable "enable_auto_scaling" {
  description = "Allow auto scaling"
  default = false
}

variable "sku_name" {
  type        = string
  description = "Select Standard or Premium SKU"
  default     = "standard"
}

variable "network_plugin_type" {
  type        = string
  description = "Network plugin type"
  default     = "kubenet"
}

variable "identity_type" {
  description = "Identity type"
  default = "SystemAssigned"
}

variable "acr_role_definition_name" {
  description = "Acr pull access rule name"
  default = "AcrPull"
}

variable "vault_role_definition_name" {
  description = "Key vault user access rule name"
  default = "Key Vault Secrets User"
}

variable "skip_service_principal_aad_check" {
  description = "allow skip service principal aad check"
  default = true
}

variable "acr_id" {
  description = "Acr ID."
}

variable "key_vault_id" {
  description = "Vault ID."
}
















