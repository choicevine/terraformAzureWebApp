# --------------------------------------------------------
# Static Website
# --------------------------------------------------------
 
resource "azurerm_static_site" "this" {
  name                = "${local.resource_prefix}-static-web"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_size            = "Free"
  sku_tier            = "Free"
  
  lifecycle {
    ignore_changes = [
      sku_size, sku_tier
    ]
  }

}

resource "null_resource" "update_appsettings" {
 
 provisioner "local-exec" {
    command = <<EOT
     az rest --method put --headers "Content-Type=application/json" --uri "${local.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Web/staticSites/${local.static_site_name}/config/functionappsettings?api-version=2019-12-01-preview" --body "{\"properties\":{\"AADClientID\": \"${local.AADClientID}\",\"AADSecret\": \"${local.AADSecret}\"}}"
   EOT
   }

}