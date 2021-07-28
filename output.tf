
output "API_Key" {
  value = azurerm_static_site.this.api_key
  #sensitive = true
}

output "default_host_name" {
  value = azurerm_static_site.this.default_host_name
}

output "Github_File_Name" {
  value ="azure-static-web-apps-${trimsuffix(azurerm_static_site.this.default_host_name,".azurestaticapps.net")}.yml"  
}


output "AADClientID" {
   value       =  var.ad_auth_flag == true ? azuread_application.application[0].application_id : "N/A"
}

output "app_reg_secret_password" {
  value       =  var.ad_auth_flag == true ? azuread_application_password.this[0].value : "N/A"
}


output "Grant_Admin_Consent_url" {
  value       =  var.ad_auth_flag == true ? "https://login.microsoftonline.com/${local.tenant_id}/adminconsent?client_id=${local.AADClientID}" :"N/A"
}
