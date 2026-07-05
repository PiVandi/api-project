resource "azurerm_resource_group" "rg" {
  name     = "rg-demo"
  location = var.azure_region
}

resource "azurerm_virtual_network" "vnet" {
  name                = "demo-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  address_space = ["10.0.0.0/16"] # wieso diesen Address_space?
}