resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "random_string" "storage_suffix" {
  length  = 6
  upper   = false
  lower   = true
  numeric = true
  special = false
}

resource "azurerm_storage_account" "example" {
  name                     = "${var.storage_account_name}${random_string.storage_suffix.result}"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "example" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}

data "archive_file" "terraform_code" {
  type        = "zip"
  source_dir  = path.module
  output_path = "${path.module}/${var.blob_name}"
  excludes = [
    ".terraform",
    "terraform.tfstate",
    "terraform.tfstate.backup",
    "tfplan",
    var.blob_name,
  ]
}

resource "azurerm_storage_blob" "archive_blob" {
  name                   = var.blob_name
  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = "Block"
  source                 = data.archive_file.terraform_code.output_path
}