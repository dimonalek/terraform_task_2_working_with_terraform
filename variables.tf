variable "resource_group_name" {
  type        = string
  description = "The name of the Azure resource group."
  default     = "example-resources"
}

variable "location" {
  type        = string
  description = "Azure region for resources."
  default     = "West Europe"
}

variable "storage_account_name" {
  type        = string
  description = "Globally unique storage account name base prefix."
  default     = "examplestorageacc"
}

variable "container_name" {
  type        = string
  description = "Blob container name."
  default     = "terraform-state"
}

variable "blob_name" {
  type        = string
  description = "Blob object name."
  default     = "terraform_code.zip"
}
