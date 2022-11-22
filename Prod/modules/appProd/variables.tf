
variable "rg_name" {
    type = string
    default = "MonRG"
}

variable "location"{
    type = string
    default = "WEST US"
}

variable "app_service_plan_name"{
    type = string
    default = "khaledPlanAppProd"
}

variable "app_service_name"{
    type = string
    default = "khaledAppServiceProd"
}
