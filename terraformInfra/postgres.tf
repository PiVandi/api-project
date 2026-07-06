resource "azurerm_postgresql_flexible_server" "postgres" {

  name                   = "demo-postgres-pg-pitt"
  resource_group_name    = data.azurerm_resource_group.rg.name
  location               = data.azurerm_resource_group.rg.location

  administrator_login    = var.db_admin #per Umgebungsvariable?
  administrator_password = var.db_password #per Umgebungsvariable?

  version = "16"

  storage_mb = 32768

  sku_name = "B_Standard_B1ms"
}

resource "azurerm_postgresql_flexible_server_database" "db" {

  name      = "orders"
  server_id = azurerm_postgresql_flexible_server.postgres.id
}