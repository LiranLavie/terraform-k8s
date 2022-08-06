resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location
}

resource "azurerm_resource_group" "shared_rg" {
  name     = var.shared_rg_name
  location = var.rg_location
}

# Managed Kubernetes Service (AKS)

# Staging cluster
module "aks_stagting" {
  source = "./modules/aks"
  node_count = var.node_count
  rg_location = azurerm_resource_group.rg.location
  rg_name = azurerm_resource_group.rg.name
  acr_id = azurerm_container_registry.acr.id
  cluster_name = var.staging_cluster_name
  environment = var.staging_cluster_name
  key_vault_id = module.vault.azurerm_key_vault_id
}

# Production Cluster
module "aks_production" {
  source = "./modules/aks"
  node_count = var.node_count
  rg_location = azurerm_resource_group.rg.location
  rg_name = azurerm_resource_group.rg.name
  acr_id = azurerm_container_registry.acr.id
  cluster_name = var.production_cluster_name
  environment = var.production_cluster_name
  key_vault_id = module.vault.azurerm_key_vault_id
}

# Azure Container Registry
resource "azurerm_container_registry" "acr" {
  name                = var.app_name
  resource_group_name = var.shared_rg_name
  location            = var.rg_location
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled
}

# Azure Vault
module "vault" {
  source = "./modules/vault"
  rg_name = var.shared_rg_name
  rg_location = azurerm_resource_group.rg.location
  secret_maps = var.secret_maps
}








#Create a storage account to store state
#resource "azurerm_storage_account" "webserver_storage_account" {
#  name                     = "tfstat001"
#  resource_group_name      = azurerm_resource_group.terraform.name
#  location                 = azurerm_resource_group.terraform.location
#  account_tier             = "Standard"
#  account_replication_type = "LRS"
#}
#
##Add a storage container for storing state
#resource "azurerm_storage_container" "tfstate" {
#  name                  = "tfstate"
#  storage_account_name  = azurerm_storage_account.webserver_storage_account.name
#  container_access_type = "blob"
#}