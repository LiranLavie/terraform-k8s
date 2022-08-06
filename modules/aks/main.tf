# AKS Module
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.cluster_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  http_application_routing_enabled = var.http_application_routing_enabled
  dns_prefix          = var.cluster_name
  role_based_access_control_enabled = var.role_based_access_control_enabled


  default_node_pool {
    name            = var.cluster_name
    node_count      = var.node_count
    vm_size         = var.vm_size_type
    os_disk_size_gb = var.os_disk_size_gb
    enable_auto_scaling = var.enable_auto_scaling

  }

  # Create managed identity and attach it to the aks cluster
   identity {
    type = var.identity_type
  }

    network_profile {
    load_balancer_sku = var.sku_name
    network_plugin    = var.network_plugin_type
  }

  tags = {
    Environment = var.environment
  }
}

# Add AcrPull role to aks managed identity
resource "azurerm_role_assignment" "role_acrpush" {
  scope                            = var.acr_id
  role_definition_name             = var.acr_role_definition_name
  principal_id                     = azurerm_kubernetes_cluster.aks_cluster.kubelet_identity.0.object_id
  skip_service_principal_aad_check = var.skip_service_principal_aad_check
}

# Add Key Vault Secrets User role to aks managed identity
resource "azurerm_role_assignment" "vault_user" {
  scope                            = var.key_vault_id
  role_definition_name             = var.vault_role_definition_name
  principal_id                     = azurerm_kubernetes_cluster.aks_cluster.kubelet_identity.0.object_id
  skip_service_principal_aad_check = var.skip_service_principal_aad_check
}