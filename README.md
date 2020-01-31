# Azure Keycloak Virtual Machine module
Terraform module to deploy Keycloak service

## Providers

| Name | Version |
|------|---------|
| azurerm | ~> 1.42 |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| admin\_public\_key | Content of admin\_username authorized\_keys file | `any` | n/a | yes |
| admin\_username | Specifies the name of the local administrator account. | `string` | `"keycloak"` | no |
| existing\_rg | Specifies the name of the resource group the existing Virtual Network is located in. | `any` | n/a | yes |
| existing\_subnet\_name | Specifies the name of the existing Subnet. | `any` | n/a | yes |
| existing\_vnet\_name | Specifies the name of the existing Virtual Network. | `any` | n/a | yes |
| tags | A mapping of tags to assign to the Virtual Machine. | `map(string)` | <pre>{<br>  "environment": "development",<br>  "service": "keycloak"<br>}<br></pre> | no |
| vm\_name | Specifies the name of the Virtual Machine. Changing this forces a new resource to be created. | `any` | n/a | yes |
| vm\_size | Specifies the size of the Virtual Machine. | `string` | `"Standard_DS1_v2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| private\_ip\_address | The first private IP address of the network interface |