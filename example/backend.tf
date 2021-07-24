terraform {
  backend "azurerm" {
    storage_account_name = "arupterraformst001"
    container_name       = "tfstate"
    access_key           = "2KZopmUtmjpDggw4gGR8sLFbvNycPAIrBuZ4wCBG1rNz23BiF9J6cLwjaQdZKY/CEE1DF5jY0nMdGIicHxWWSg=="
    resource_group_name  = "arup-management-core-rg"
    key                  = "arup-sn-azure-staticwebsite-rg.tfstate"
    environment          = "public"
  }
}
