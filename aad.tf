resource "azuread_group" "aad_b2b_group" {
  count = var.ad_auth_flag == true  && var.b2b_group_flag == true ? 1:0
  display_name = "${local.resource_prefix}-B2B-Access"
  owners       = data.azuread_user.owner[*].id
}

