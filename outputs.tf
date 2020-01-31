output "private_ip_address" {
  value       = azurerm_network_interface.main.private_ip_address
  description = "The first private IP address of the network interface"
}
