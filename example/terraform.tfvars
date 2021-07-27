# --------------------------------------------------------
# Billing Tags
# --------------------------------------------------------

costcenter    = "00-000"
jobnumber     = "000000-00"
owner              = "Kieran.Trainor@arup.com"
application        = "vtours site"
requestNumber      = "RITM"
financeAdmin       = "Kieran.Trainor@arup.com"
criticality        = "important"

# --------------------------------------------------------
# Application Details
# --------------------------------------------------------

rg_location           = "uksouth"
service = "vtours"
users_contributors = ["Kieran.Trainor@arup.com"]
owners             = ["Kieran.Trainor@arup.com"]

websites = {
    "afan-vtours"  ={   location = "westeurope"
                        website_dns_name = "afan-vtours.arup.com" 
                        ad_auth_flag = true 
                        b2b_group_flag = true
                    },
    "qfan-vtours"  ={   location = "westeurope"
                        website_dns_name = "qfan-vtours.arup.com" 
                        ad_auth_flag = true 
                        b2b_group_flag = true
                    },
                     

  }