output "api_url" {
  value = azurerm_container_app.app.latest_revision_fqdn
}

output "db_host" {
  value = azurerm_postgresql_flexible_server.postgres.fqdn
}