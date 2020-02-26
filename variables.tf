variable "vm_name" {
  description = "Specifies the name of the Virtual Machine. Changing this forces a new resource to be created."
}

variable "vm_size" {
  description = "Specifies the size of the Virtual Machine."
  default     = "Standard_DS1_v2"
}

variable "existing_rg" {
  description = "Specifies the name of the resource group the existing Virtual Network is located in."
}

variable "existing_vnet_name" {
  description = "Specifies the name of the existing Virtual Network."
}

variable "existing_subnet_name" {
  description = "Specifies the name of the existing Subnet."
}

variable "admin_username" {
  description = "Specifies the name of the local administrator account."
  default     = "linuxadmin"
}

variable "admin_public_key" {
  description = "Content of admin_username authorized_keys file"
}

variable "tags" {
  description = "A mapping of tags to assign to the Virtual Machine."
  type        = map(string)
  
  default = {
    environment = "development"
  }
}

variable "custom_data" {
  description = "Specifies custom data to supply to the machine. On Linux-based systems, this can be used as a cloud-init script."
  default     = "apt_upgrade: true"
}

variable "delete_disks_on_termination" {
  description = "Delete all disks on when virtual machine is deleted"
  default     = false
}

variable "domain_name_label" {
  description = "Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system."
}
