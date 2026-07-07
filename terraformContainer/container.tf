data "terraform_remote_state" "infra" {
  backend = "azurerm"
  config = {
    resource_group_name  = "1-1e1aca14-playground-sandbox"
    storage_account_name = "mystorageaccount23"
    container_name       = "tfstate"
    key                  = "infra.tfstate"
  }
}



resource "azurerm_container_app_environment" "env" {
  name                = "my-container-env"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}




resource "azurerm_container_app" "api" {

  name                         = "demo-api"
  container_app_environment_id = azurerm_container_app_environment.env.id
  resource_group_name          = data.azurerm_resource_group.rg.name
  revision_mode                = "Single"

  template {
    max_replicas = 1
    container {
      name  = "api"
      image = "${azurerm_container_registry.acr.login_server}/api:latest"
      cpu    = 0.5
      memory = "1Gi"
      
      env {
        name  = "DATABASE_URL"
        value = data.terraform_remote_state.infra.outputs.database_url
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

resource "azurerm_api_management_api" "api" {
  name                = "demo-api-pitt"
  resource_group_name = data.azurerm_resource_group.rg.name
  api_management_name = azurerm_api_management.apim.name
  revision            = "1"
  display_name        = "Demo API"
  path                = "api"
  protocols           = ["https"]

  service_url = azurerm_container_app.api.latest_revision_fqdn
}

output "api_url" {
  value = azurerm_container_app.api.latest_revision_fqdn
}
