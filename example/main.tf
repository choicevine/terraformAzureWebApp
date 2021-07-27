# --------------------------------------------------------
# Provider             
# --------------------------------------------------------

provider "azurerm" {
  features {}
}

provider "azurerm" {
  subscription_id = "d7f6a823-cb52-4008-a038-32f6c6ba6662"
  alias           = "core"
  features {}

}

# --------------------------------------------------------
# Resource Group
# --------------------------------------------------------

#module "resourcegroup" {
#  source             = "git::https://ovearup@dev.azure.com/ovearup/Terraform%20Modules/_git/az_resource_group?ref=v1.4.3"
#  service            = var.service
#  location           = var.rg_location
#  envname            = terraform.workspace
#  tags               = local.standard_tags
#  users_contributors = var.users_contributors
#  owners             = var.owners
#  pipeline           = var.pipeline
#}


# --------------------------------------------------------
# Static Website
# --------------------------------------------------------

module "static_webapp" {
  for_each = var.websites
  source             = "../"
  envname            = terraform.workspace
  resource_group_name = "arup-sn-azure-staticwebsite-test-rg"
  owners             = var.owners
  location           = each.value.location
  website_dns_name =  each.value.website_dns_name 
  ad_auth_flag = each.value.ad_auth_flag
  b2b_group_flag =  each.value.b2b_group_flag
  name = each.key
  tags               = local.standard_tags
}


# --------------------------------------------------------
# Key Vault 
# --------------------------------------------------------

resource "azurerm_key_vault" "key_vault" {
  name                        = "arup${var.service}${terraform.workspace}-kv"
  location                    = "uksouth"
  resource_group_name         = "arup-sn-azure-staticwebsite-test-rg"
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled    = true
  #tags                        = merge(local.standard_tags, map("Creator", "Terraform"))
  sku_name                    = "standard"
}


resource "azurerm_key_vault_access_policy" "terraform_access_policy" {
  key_vault_id = azurerm_key_vault.key_vault.id
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id
  secret_permissions = [
    "get",
    "list",
    "set",
    "delete",
    "recover",
    "backup",
    "restore",
  ]
}


resource "azurerm_key_vault_access_policy" "cloud_team_policy" {
  key_vault_id = azurerm_key_vault.key_vault.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azuread_group.cloud_team.object_id

  secret_permissions = [
    "get", "list"
  ]
}

#resource "azurerm_key_vault_access_policy" "contributors_policy" {
 # key_vault_id = azurerm_key_vault.key_vault.id

  #tenant_id = data.azurerm_client_config.current.tenant_id
  #object_id = module.resourcegroup.azure_ad_contributor_group_id

  #secret_permissions = [
   # "get", "list"
  #]
#}


resource "azurerm_key_vault_secret" "API_key" {
  for_each = var.websites
  name         = "${each.key}-api-key"
  value        = module.static_webapp[each.key].API_Key
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "app_registration_secret" {
  for_each = var.websites
  name         = "${each.key}-app-registration-secret"
  value        = module.static_webapp[each.key].app_reg_secret_password
  key_vault_id = azurerm_key_vault.key_vault.id
}