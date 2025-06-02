##-----------------------------------------------------------------------------
## Naming convention
##-----------------------------------------------------------------------------
variable "custom_name" {
  type        = string
  default     = null
  description = "Define your custom name to override default naming convention"
}

variable "resource_position_prefix" {
  type        = bool
  default     = true
  description = <<EOT
Controls the placement of the resource type keyword (e.g., "vnet", "ddospp") in the resource name.

- If true, the keyword is prepended: "vnet-core-dev".
- If false, the keyword is appended: "core-dev-vnet".

This helps maintain naming consistency based on organizational preferences.
EOT
}

##-----------------------------------------------------------------------------
## Label Module
##-----------------------------------------------------------------------------
variable "name" {
  type        = string
  default     = ""
  description = "Name of the resource (e.g. `app` or `cluster`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment where resources will be deployed (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment", "location"]
  description = "Label order, e.g. `name`,`application`,`centralus`."
}

variable "managedby" {
  type        = string
  default     = "hello@clouddrove.com"
  description = "ManagedBy tag value, e.g. 'CloudDrove'."
}

variable "repository" {
  type        = string
  default     = ""
  description = "Terraform current module repository URL."
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Flag to control the module creation."
}

variable "deployment_mode" {
  type        = string
  default     = "terraform"
  description = "Specifies how the infrastructure/resource is deployed"
}

variable "extra_tags" {
  type        = map(string)
  default     = null
  description = "Variable to pass extra tags."
}

variable "resource_group_name" {
  description = "The name of the resource group to create the resources in."
  type        = string
}

variable "location" {
  description = "The location to create the resources in."
  type        = string
}

## -----------------------------------------------------------------------------
## Log Analytics Workspace
## -----------------------------------------------------------------------------

variable "log_analytics_workspace_sku" {
  type        = string
  default     = "PerGB2018"
  description = "pecifies the Sku of the Log Analytics Workspace. Possible values are Free, PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation, and PerGB2018 (new Sku as of 2018-04-03). Defaults to PerGB2018"

}

variable "create_log_analytics_workspace" {
  type        = bool
  default     = true
  description = "The Flag for Module Enable or Disabled if it will false it will take `existing_log_analytics_workspace`."
}

variable "retention_in_days" {
  type        = number
  default     = null
  description = "The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730."
}

variable "daily_quota_gb" {
  type        = string
  default     = "-1"
  description = "The workspace daily quota for ingestion in GB. Defaults to -1 (unlimited) if omitted."
}

variable "internet_ingestion_enabled" {
  type        = bool
  default     = true
  description = "Should the Log Analytics Workspace support ingestion over the Public Internet? Defaults to true."
}

variable "internet_query_enabled" {
  type        = bool
  default     = true
  description = "Should the Log Analytics Workspace support querying over the Public Internet? Defaults to true."
}

variable "log_analytics_destination_type" {
  type        = string
  default     = "AzureDiagnostics"
  description = "Possible values are AzureDiagnostics and Dedicated, default to AzureDiagnostics. When set to Dedicated, logs sent to a Log Analytics workspace will go into resource specific tables, instead of the legacy AzureDiagnostics table."
}

variable "Metric_enable" {
  type        = bool
  default     = true
  description = "Is this Diagnostic Metric enabled? Defaults to true."
}

variable "diagnostic_setting_enable" {
  type    = bool
  default = false
}

variable "log_analytics_workspace_id" {
  type    = string
  default = null
}

variable "category" {
  type        = string
  default     = null
  description = " The name of a Diagnostic Log Category Group for this Resource."
}

variable "storage_account_id" {
  type        = string
  default     = null
  description = "The ID of the Storage Account where logs should be sent."
}

variable "eventhub_name" {
  type        = string
  default     = null
  description = "Specifies the name of the Event Hub where Diagnostics Data should be sent."
}

variable "eventhub_authorization_rule_id" {
  type        = string
  default     = null
  description = "Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data."
}

variable "diagnostic_setting_enabled_log_categories" {
  description = "A list of log categories to be enabled for this diagnostic setting."
  type        = list(string)
  default     = ["Audit"]
}

variable "diagnostic_setting_enabled_metric_categories" {
  description = "A list of metric categories to be enabled for this diagnostic setting."
  type        = list(string)
  default     = []
}