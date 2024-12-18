variable "resource_group_name" {
  description = "Name of resource group provided by the lab."
  type        = string
}

variable "vnet_name" {
  description = "Name of the Virtual Network provided by the lab."
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet to use in the Virtual Network. Defaults to web."
  type        = string
  default     = "web"
}

variable "prefix" {
  description = "Naming prefix for resources. Should be 3-8 characters."
  type        = string
  default     = "tacoweb"

  validation {
    condition     = length(var.prefix) >= 3 && length(var.prefix) <= 8
    error_message = "Naming prefix should be between 3-8 characters. Submitted value was ${length(var.prefix)}."
  }
}

variable "application_port" {
  description = "Port to use for the flask application. Defaults to 8080."
  type        = number
  default     = 8080
}