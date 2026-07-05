resource "azurerm_container_app" "api" {

  name                         = "demo-api"
  container_app_environment_id = azurerm_container_app_environment.env.id
  resource_group_name          = azurerm_resource_group.rg.name
  revision_mode                = "Single"

  template {

    container {
      name  = "api"
      image = "${azurerm_container_registry.acr.login_server}/api:latest"
      cpu    = 0.5
      memory = "1Gi"
      
      env {
        name  = "DATABASE_URL"
        value = local.DATABASE_URL
      }
    }
  }


  ingress {

    external_enabled = false
    target_port      = 5000
    transport        = "http"

    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }
}