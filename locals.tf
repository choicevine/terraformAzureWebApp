locals{
resource_prefix           = lower("arup-${var.name}-${var.envname}")
resource_prefix_no_hyphen = "arup${var.name}${var.envname}"
AADClientID = azuread_application.application[0].application_id
AADSecret = azuread_application_password.this[0].value
subscription_id = data.azurerm_subscription.current.id
static_site_name = azurerm_static_site.this.name
tenant_id = data.azuread_client_config.current.tenant_id

}
