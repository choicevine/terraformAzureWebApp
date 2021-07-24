
variable "websites" {
}

variable "costcenter" {
  type        = string
  description = "(Required) CostCode tag"
}

variable "jobnumber" {
  type        = string
  description = "(Required) JobNumber tag"
}

variable "application" {
  type        = string
}

variable "owner" {
  type        = string
  description = "(Required) Name of Application Owner"
}

variable "requestNumber" {
  type        = string
  description = "(Required) ServiceNow Request Number"
}

variable "financeAdmin" {
  type        = string
  description = "(Required) Name of Finance Admin Owner"
}

variable "repo" {
  type        = string
  description = "(Optional) git repo name"
  default     = ""
}

variable "criticality" {
  type        = string
  description = "(Optional) - (1)critical, (2)essential, (3)important, (4)supportive, other"
  default     = ""
}

####################################

variable "service" {
  type        = string
  description = "Resource Group service name"
}


variable "rg_location" {
  type        = string
  description = "Resource Group location"
}


variable "users_contributors" {
  type    = list
  default = []
}

variable "users_readers" {
  type    = list
  default = []
}

variable "owners" {
  type    = list
  default = []
}

variable "pipeline" {
  type    = bool
  default = false
}