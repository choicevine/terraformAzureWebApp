# --------------------------------------------------------
# Azure AAD App Registration 
# --------------------------------------------------------

resource "azuread_application" "application" {
count = var.ad_auth_flag == true ? 1:0 
  display_name    = "arup-${var.service}-${var.name}-${terraform.workspace}-app-reg"
  owners           =  data.azuread_user.owner[*].id

   web {
    homepage_url  = "https://${var.website_dns_name}"
    logout_url    = "https://${var.website_dns_name}/logout"
    redirect_uris = ["https://${var.website_dns_name}/.auth/login/aad/callback", "https://${azurerm_static_site.this.default_host_name}/.auth/login/aad/callback"]

    implicit_grant {
      access_token_issuance_enabled = false
    }
    
  }
  lifecycle {
    ignore_changes = [reply_urls]
  }
}

###check and make a senstive value

resource "azuread_application_password" "this" {
  count = var.ad_auth_flag == true ? 1:0 
  display_name = "${var.name}-secret"
  application_object_id = azuread_application.application[0].id
  end_date              = "2040-01-01T01:02:03Z"
}


resource "azuread_service_principal" "this" {
  count = var.ad_auth_flag == true ? 1:0 
  application_id               = azuread_application.application[0].application_id
  app_role_assignment_required = true 
}

# how to add owner to azuread_service_principal --- https://www.gitmemory.com/issue/terraform-providers/terraform-provider-azuread/199/647710067
# how to add users and groups to azuread_service_principal -- https://github.com/hashicorp/terraform-provider-azuread/issues/164



