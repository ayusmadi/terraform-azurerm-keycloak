variable "vm_name" {
  description = "Placeholder"
}

variable "vm_size" {
  description = "Placeholder"
  default     = "Standard_DS1_v2"
}

variable "existing_rg" {
  description = "Placeholder"
}

variable "existing_vnet_name" {
  description = "Placeholder"
}

variable "existing_subnet_name" {
  description = "Placeholder"
}

variable "admin_username" {
  description = "Placeholder"
  default     = "keycloak"
}

variable "admin_public_key" {
  description = "Placeholder"
}

variable "tags" {
  description = "Placeholder"
  type        = map(string)
  
  default = {
    environment = "development"
    service     = "keycloak"
  }
}
