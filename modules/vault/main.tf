# Vault Module
data "azurerm_client_config" "current" {}

# Create the Azure Key Vault
resource "azurerm_key_vault" "key_vault" {
  name                = var.vault_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  enable_rbac_authorization = var.enable_rbac_authorization

  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment

  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name  = var.sku_name
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled

}

# Add secrets to key vault
resource "azurerm_key_vault_secret" "example" {
  count = length(var.secret_maps)
  name         = keys(var.secret_maps)[count.index]
  value        = values(var.secret_maps)[count.index]
  key_vault_id = azurerm_key_vault.key_vault.id
}


