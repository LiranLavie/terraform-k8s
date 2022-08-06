output "aks_cluster" {
  value       = azurerm_kubernetes_cluster.aks_cluster
  description = "Reference to AKS cluster"
}

output "identity_principal_id" {
  value       = azurerm_kubernetes_cluster.aks_cluster.kubelet_identity.0.object_id
  description = "AKS managed identity principal id"
}