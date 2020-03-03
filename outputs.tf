output "private_ip_address" {
  value       = azurerm_network_interface.main.private_ip_address
  description = "The first private IP address of the network interface"
}

output "public_ip_address" {
  value       = azurerm_public_ip.main.ip_address
  description = "Public IP address associated with the network interface"
}

output "admin_password" {
  value       = random_password.password.result
  description = "Password to access the Linux virtual machine"
  sensitive   = true
}

output "fqdn" {
  value = azurerm_public_ip.main.fqdn
  description = "Fully qualified domain name of the A DNS record associated with the public IP. domain_name_label must be specified to get the fqdn. This is the concatenation of the domain_name_label and the regionalized DNS zone"
}
