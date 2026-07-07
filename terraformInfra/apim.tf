resource "azurerm_api_management" "apim" {
  name                = "demo-apim-pitt-1"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  publisher_name  = "demo"
  publisher_email = "demo@example.com"

  sku_name = "Developer_1"
}


resource "azurerm_api_management_subscription" "client" {
  api_management_name = azurerm_api_management.apim.name
  resource_group_name = data.azurerm_resource_group.rg.name

  display_name = "demoClient42"

  primary_key = "TestKey42!"
}