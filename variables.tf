variable "name" {
  type        = string

}
variable "owners" {
  type    = list
  default = []
}

variable "website_dns_name" {
  type        = string

}

variable "ad_auth_flag" {
  type        =bool
  default = false

}

variable "b2b_group_flag" {
  type        =bool
  default = false

}

variable "location" {
  type        = string
  description = "Resource Group location"
}

variable "resource_group_name" {
  type        = string
}

variable "envname" {
  type        = string
}


variable "tags" {
  type = map
}
