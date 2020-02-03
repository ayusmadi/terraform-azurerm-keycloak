output "private_ip_address" {
  value       = azurerm_network_interface.main.private_ip_address
  description = "The first private IP address of the network interface"
}

output "public_ip_address" {
  value       = azurerm_network_interface.public_ip_address.ip_address
  description = "Public IP address associated with the network interface"
}

output "admin_password" {
  value       = random_password.password.result
  description = "Password to access the Linux virtual machine"
  sensitive   = true
}
