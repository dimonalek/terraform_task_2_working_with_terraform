output "storage_blob_id" {
  description = "The resource ID of the storage blob."
  value       = azurerm_storage_blob.archive_blob.id
}

output "storage_blob_url" {
  description = "The URL of the uploaded storage blob."
  value       = azurerm_storage_blob.archive_blob.url
}
