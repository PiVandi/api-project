variable "azure_region" {
  description = "Azure region"
  type        = string
  default     = "westeurope"
}


# wie werden Credentials über Pipeline übergeben?
variable "db_user" {
    type = string
}

variable "db_password" {
    type = string
    sensitive = true
}