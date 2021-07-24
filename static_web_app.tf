# --------------------------------------------------------
# Static Website
# --------------------------------------------------------
 
resource "azurerm_static_site" "this" {
  name                = "arup-${var.service}-${var.name}-${var.envname}-static-web-app"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_size            = "Free"
  sku_tier            = "Free"
  tags = var.tags
  lifecycle {
    ignore_changes = [
      sku_size, sku_tier
    ]
  }

}

resource "null_resource" "update_appsettings" {


}