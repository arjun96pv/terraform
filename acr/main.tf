data "azurerm_resource_group" "terraform" {
  name = "terraform_rg"
}

resource "azurerm_container_registry" "acr22" {
  name                = var.container
  resource_group_name = data.azurerm_resource_group.terraform.name
  location            = data.azurerm_resource_group.terraform.location
  sku                 = "Premium"
  admin_enabled       = true

}

output "user_pasword" {
  value     = azurerm_container_registry.acr22.admin_password
  sensitive = true
}

output "user_name" {
  value     = azurerm_container_registry.acr22.admin_username
  sensitive = true
}

data "azurerm_container_registry_scope_map" "scope" {
  name                    = var.scopepush
  resource_group_name     = data.azurerm_resource_group.terraform.name
  container_registry_name = azurerm_container_registry.acr22.name
}

resource "azurerm_container_registry_token" "tokenpush" {
  name                    = var.tokenpush
  resource_group_name     = data.azurerm_resource_group.terraform.name
  container_registry_name = azurerm_container_registry.acr22.name
  scope_map_id            = data.azurerm_container_registry_scope_map.scope.id
}

resource "azurerm_container_registry_token_password" "example" {
  container_registry_token_id = azurerm_container_registry_token.tokenpush.id
  password1 {
    expiry = "2024-12-22T17:57:36+08:00"
  }
}

output tokenpasswd{
value = azurerm_container_registry_token_password.example.password1
sensitive = true

}

