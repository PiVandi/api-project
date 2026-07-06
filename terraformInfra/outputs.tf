output "api_url" {
  value = azurerm_container_app.api.latest_revision_fqdn
}

output "db_host" {
  value = azurerm_postgresql_flexible_server.postgres.fqdn
}

output "database_url" {
  value     = local.DATABASE_URL
  sensitive = true
}