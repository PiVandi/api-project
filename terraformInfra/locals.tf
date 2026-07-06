
# locals ist nicht sicher -> wird in tfstate gespeichert, in PRD über Vault handlen
locals {
  DATABASE_URL = "postgresql://${var.db_admin}:${var.db_password}@${azurerm_postgresql_flexible_server.postgres.fqdn}:5432/${azurerm_postgresql_flexible_server_database.db.name}" #var DB User müssen noch geklärt werden
}