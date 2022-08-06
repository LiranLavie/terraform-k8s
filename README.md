# Weight Tracker K8s Infrastructure
**This project demonstrates how to create a Kubernetes infrastructure with Terraform**

![demo](doc/project12.png)

The infrastructure:
* **Managed Kubernetes Service (AKS)** - for Staging and Production environments
* **Azure Container Registry** 
* **Azure Vault**

## Configuration

1. Remote backend for Terraform state storage.
2. **Module for AKS** :
   - Create an azurerm Kubernetes cluster for each environment 
   - Attach managed identity for the AKS
   - Assign **Acrpull Role** for aks identity
   - Assign **Key Vault Secrets User** role for aks identity
3. **Module for Azure Vault** :
   - Create azurerm key vault resource
   - Add secrets to the vault



| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.16.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.16.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aks_production"></a> [aks\_production](#module\_aks\_production) | ./modules/aks | n/a |
| <a name="module_aks_stagting"></a> [aks\_stagting](#module\_aks\_stagting) | ./modules/aks | n/a |
| <a name="module_vault"></a> [vault](#module\_vault) | ./modules/vault | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.acr](https://registry.terraform.io/providers/hashicorp/azurerm/3.16.0/docs/resources/container_registry) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/3.16.0/docs/resources/resource_group) | resource |
| [azurerm_resource_group.shared_rg](https://registry.terraform.io/providers/hashicorp/azurerm/3.16.0/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acr_admin_enabled"></a> [acr\_admin\_enabled](#input\_acr\_admin\_enabled) | allow admin | `any` | n/a | yes |
| <a name="input_acr_sku"></a> [acr\_sku](#input\_acr\_sku) | Select Standard or Premium SKU | `string` | `"Standard"` | no |
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | name of the webapp. | `any` | n/a | yes |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | Number of nodes in the cluster. | `any` | n/a | yes |
| <a name="input_production_cluster_name"></a> [production\_cluster\_name](#input\_production\_cluster\_name) | production\_cluster\_name | `any` | n/a | yes |
| <a name="input_rg_location"></a> [rg\_location](#input\_rg\_location) | location of the resource group. | `any` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Name of the resource group. | `any` | n/a | yes |
| <a name="input_secret_maps"></a> [secret\_maps](#input\_secret\_maps) | Secrets added to key vault. | `any` | n/a | yes |
| <a name="input_shared_rg_name"></a> [shared\_rg\_name](#input\_shared\_rg\_name) | Name of the resource group. | `any` | n/a | yes |
| <a name="input_staging_cluster_name"></a> [staging\_cluster\_name](#input\_staging\_cluster\_name) | staging\_cluster\_name | `any` | n/a | yes |

