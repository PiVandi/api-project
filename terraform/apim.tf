resource "azurerm_api_management" "apim" {
  name                = "demo-apim"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  publisher_name  = "demo"
  publisher_email = "demo@example.com"

  sku_name = "Developer_1"
}
resource "azurerm_api_management_api" "api" {
  name                = "demo-api"
  resource_group_name = azurerm_resource_group.rg.name
  api_management_name = azurerm_api_management.apim.name
  revision            = "1"
  display_name        = "Demo API"
  path                = "api"
  protocols           = ["https"]

  service_url = azurerm_container_app.api.latest_revision_fqdn
}
