# terraform-azurerm-keycloak
Terraform module to deploy Keycloak service

## Providers

| Name | Version |
|------|---------|
| azurerm | ~> 1.42 |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| admin\_public\_key | Placeholder | `any` | n/a | yes |
| admin\_username | Placeholder | `string` | `"keycloak"` | no |
| existing\_rg | Placeholder | `any` | n/a | yes |
| existing\_subnet\_name | Placeholder | `any` | n/a | yes |
| existing\_vnet\_name | Placeholder | `any` | n/a | yes |
| tags | Placeholder | `map(string)` | <pre>{<br>  "environment": "development",<br>  "service": "keycloak"<br>}<br></pre> | no |
| vm\_name | Placeholder | `any` | n/a | yes |
| vm\_size | Placeholder | `string` | `"Standard_DS1_v2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| private\_ip\_address | The first private IP address of the network interface |