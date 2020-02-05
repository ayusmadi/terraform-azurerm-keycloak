terraform {
  required_providers {
    azurerm = "~> 1.42"
    random  = "~> 2.2.1"
  }
}

data "azurerm_resource_group" "main" {
  name = var.existing_rg
}

data "azurerm_subnet" "main" {
  name                 = var.existing_subnet_name
  virtual_network_name = var.existing_vnet_name
  resource_group_name  = data.azurerm_resource_group.main.name
}

resource "random_password" "password" {
  length           = 8
  min_upper        = 1
  min_lower        = 1
  min_special      = 1
  special          = true
  override_special = "!@#$%&"
}

resource "azurerm_public_ip" "main" {
  name                = "${var.vm_name}-pip"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "main" {
  name                = "${var.vm_name}-nic"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name

  ip_configuration {
    name                          = "ipconfiguration1"
    subnet_id                     = data.azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main.id
  }
}

resource "azurerm_virtual_machine" "main" {
  name                  = var.vm_name
  location              = data.azurerm_resource_group.main.location
  resource_group_name   = data.azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = var.vm_size

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true


  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.vm_name}-osdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = var.vm_name
    admin_username = var.admin_username
    admin_password = random_password.password.result
    custom_data    = var.custom_data
  }

  os_profile_linux_config {
    disable_password_authentication = false
    
    ssh_keys {
      key_data = var.admin_public_key
      path     = "/home/${var.admin_username}/.ssh/authorized_keys"
    }
  }

  tags = var.tags
}
