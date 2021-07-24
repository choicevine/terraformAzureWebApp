data "azuread_user" "owner" {
  count               = var.ad_auth_flag == true ? length(var.owners) : 0
  user_principal_name = element(var.owners, count.index)
}

#data "azuread_group" "Staff_Arup" {
 #  count               = var.ad_auth == true ? 1 : 0
 #  display_name      = "Staff_Arup"
#}

#data "azuread_groups" "arup_groups" {
# count               = var.ad_auth == true ? 1 : 0
#  display_names = ["Staff_Arup", "Staff_Agency"]
#}