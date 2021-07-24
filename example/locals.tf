locals {
  standard_tags = {
    CostCenter         = var.costcenter
    JobNumber          = var.jobnumber
    Owner              = var.owner
    Application        = var.application
    Environment        = terraform.workspace
    Source             = "Terraform"
    repo               = "arup-will-update-rg"
    RequestNumber      = var.requestNumber
    FinanceAdmin       = var.financeAdmin
    Criticality        = var.criticality
    OnPremConnectivity = "no"
  }


}
