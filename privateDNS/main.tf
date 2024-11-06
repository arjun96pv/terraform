data "azurerm_resource_group" "rg" {
  name = "arjun"
}

resource "azurerm_private_dns_zone" "pdns" {
  name                = var.dns
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "vnetlink" {
  name                  = var.linkname
  resource_group_name   = data.azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.pdns.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
  registration_enabled = true
  depends_on = [azurerm_private_dns_zone.pdns, azurerm_virtual_network.vnet]
}


resource "azurerm_virtual_network" "vnet" {
  name                = var.vnetname
  address_space       = ["10.1.0.0/16"]
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

}

resource "azurerm_private_dns_a_record" "recordset" {
  name                = var.recordsetname
  zone_name           = azurerm_private_dns_zone.pdns.name
  resource_group_name = data.azurerm_resource_group.rg.name
  ttl                 = 300
  records             = ["10.1.180.17"]
}
~
~

