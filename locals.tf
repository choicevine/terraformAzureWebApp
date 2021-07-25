locals{

  #additional_user_data = local.OS_Platform == "windows" && var.domainjoin == true ? templatefile(
  #  "${path.module}/scripts/windows/domainjoin.ps1",
  #  merge({
  #    secrets_manager_secret_id = local.domain_join_secret_id
  #    ads_fq_domain_name        = var.ads_fq_domain_name
  #    ads_ou_path               = var.ads_ou_path
  #    admin_group               = var.admin_group
  #    }
  #  )
  #) : ""

}

