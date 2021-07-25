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


#resource "null_resource" "update_appsettings" {
 # provisioner "local-exec" {
  #  command = "az rest --method put --headers Content-Type=application/json --uri "/subscriptions/<YOUR_SUBSCRIPTION_ID>/resourceGroups/<YOUR_RESOURCE_GROUP_NAME>/providers/Microsoft.Web/staticSites/<YOUR_STATIC_SITE_NAME>/config/functionappsettings?api-version=2019-12-01-preview" --body @local.settings.properties.json"
    
  #}
#}