output "private_ip_address" {
  value       = azurerm_network_interface.main.private_ip_address
  description = "The first private IP address of the network interface"
}

output "admin_password" {
  value       = random_password.password.result
  description = "Password to access Keycloak virtual machine"
  sensitive   = true
}
