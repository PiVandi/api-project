variable "azure_region" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "resource_group"{
    type = string
    default = "1-1e1aca14-playground-sandbox"
}

# wie werden Credentials über Pipeline übergeben?
variable "db_admin" {
    type = string
}

variable "db_password" {
    type = string
    sensitive = true
}