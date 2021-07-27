data "azurerm_client_config" "current" {}


data "azuread_group" "cloud_team" {
  display_name = "DT Cloud Team"
}
