## Azure Static Web Apps Terraform module - WORK IN PROGRESS

Terraform module which creates Static Web Apps on Azure.

## Terraform versions

Terraform 0.15

This module features the following:

```
* Creation of Azure Static Web App (https://docs.microsoft.com/en-us/azure/static-web-apps/overview)   
* Optional - Creation of Azure App registration if site is to be protected behind an ADD logon (Assign Arup Staff groups)
* Optional - Creation of AAD B2B group - to be used for providing access to external clients.
* Outputs API_Key for upstream use - (Sensitive value)
* Outputs Github workflow file name (required for correct linking from hithub actions)

```

## Notes
* `Guide for using App Registration and Static Websites -http://jsandersblog.azurewebsites.net/2021/07/02/walkthrough-static-web-apps-and-aad-authentication/`
* `The Secret from the Azure App registration needs to be added to the Static App Env_Settings - app_settings = {} not currently supported on tereaform for azurerm_static_site. I have added a LOCAL-EXEC which updates the application setting as a temporary measure`
* `Guide on how to link githib actions to your Static App - https://docs.microsoft.com/en-us/azure/static-web-apps/github-actions-workflow`
* `Guide on how to link githib actions to your Static App - https://docs.microsoft.com/en-us/azure/static-web-apps/publish-devops`
* `This module will output the Github workflow configuration file name (exact name is required)`




 app_settings = {
    "SOME_KEY" = "some-value"
  }


## Usage

```hcl
module "static_webapp" {
  source              = "../"
  service             = var.service
  envname             = var.envname
  resource_group_name = var.resource_group_name
  owners              = var.owners
  location            = var.location
  website_dns_name    =  var.website_dns_name
  ad_auth             = var.ad_auth 
  name                = var.name
  tags                = local.standard_tags
}

```
## Examples

See examples folder - for usage sample

* Simple Example - Allows the use of a for loop to create a number of static sites.



## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | n/a |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_application.application](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application) | resource |
| [azuread_application_password.this](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_password) | resource |
| [azuread_group.aad_b2b_group](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/group) | resource |
| [azuread_service_principal.this](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal) | resource |
| [azurerm_static_site.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/static_site) | resource |
| [azuread_group.Staff_Arup](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |
| [azuread_groups.arup_groups](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/groups) | data source |
| [azuread_user.owner](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/user) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ad_auth"></a> [ad\_auth](#input\_ad\_auth) | n/a | `bool` | n/a | yes |
| <a name="input_envname"></a> [envname](#input\_envname) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Resource Group location | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_service"></a> [service](#input\_service) | Resource Group service name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map` | n/a | yes |
| <a name="input_website_dns_name"></a> [website\_dns\_name](#input\_website\_dns\_name) | n/a | `string` | n/a | yes |
| <a name="input_owners"></a> [owners](#input\_owners) | n/a | `list` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_API_Key"></a> [API\_Key](#output\_API\_Key) | n/a |
| <a name="output_Github_File_Name"></a> [Github\_File\_Name](#output\_Github\_File\_Name) | n/a |
| <a name="output_default_host_name"></a> [default\_host\_name](#output\_default\_host\_name) | n/a |
