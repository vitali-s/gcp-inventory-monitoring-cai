/******************************************
  logs_retention_iam variables
 *****************************************/
variable "project" {
  description = "Project id to add the IAM policies/bindings for Log Viewers"
  default     = "***"
}

variable "region" {
  default = "us-west1"
}

variable "bucket_prefix" {
  default = "asset-inventory-"
}

variable "storage_class" {
  default = "REGIONAL"
}

variable "service_account_id" {
  default = "asset-inventory-account"
}

variable "service_account_name" {
  default = "The service account used to export asset inventory"
}
