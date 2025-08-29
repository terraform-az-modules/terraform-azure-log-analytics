##-----------------------------------------------------------------------------
## Naming convention
##-----------------------------------------------------------------------------
variable "custom_name" {
  type        = string
  default     = null
  description = "Override default naming convention"
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
## Labels
##-----------------------------------------------------------------------------
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "managedby" {
  type        = string
  default     = "terraform-az-modules"
  description = "ManagedBy, eg 'terraform-az-modules'."
}

variable "extra_tags" {
  type        = map(string)
  default     = null
  description = "Variable to pass extra tags."
}

variable "repository" {
  type        = string
  default     = "https://github.com/terraform-az-modules/terraform-azure-log-analytics"
  description = "Terraform current module repo"

  validation {
    # regex(...) fails if it cannot find a match
    condition     = can(regex("^https://", var.repository))
    error_message = "The module-repo value must be a valid Git repo link."
  }
}

variable "location" {
  type        = string
  default     = ""
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
}

variable "deployment_mode" {
  type        = string
  default     = "terraform"
  description = "Specifies how the infrastructure/resource is deployed"
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment", "location"]
  description = "The order of labels used to construct resource names or tags. If not specified, defaults to ['name', 'environment', 'location']."
}

##-----------------------------------------------------------------------------
## Global Variables
##-----------------------------------------------------------------------------
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Log Analytics."
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}

## -----------------------------------------------------------------------------
## Log Analytics Workspace
## -----------------------------------------------------------------------------

variable "log_analytics_workspace_sku" {
  type        = string
  default     = "PerGB2018"
  description = "The SKU of the Log Analytics Workspace. Possible values are Free, PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation, and PerGB2018."
}

variable "retention_in_days" {
  type        = number
  default     = null
  description = "The workspace data retention period in days. Possible values are either 7 (Free Tier only) or range between 30 and 730."
}

variable "daily_quota_gb" {
  type        = string
  default     = "1"
  description = "The workspace daily quota for ingestion in GB. Set to -1 for unlimited ingestion."
}

variable "internet_ingestion_enabled" {
  type        = bool
  default     = true
  description = "Flag to enable Log Analytics Workspace ingestion over the Public Internet."
}

variable "internet_query_enabled" {
  type        = bool
  default     = true
  description = "Flag to enable Log Analytics Workspace querying over the Public Internet."
}

variable "log_analytics_destination_type" {
  type        = string
  default     = "AzureDiagnostics"
  description = "The destination type for logs sent to Log Analytics workspace. Possible values are AzureDiagnostics and Dedicated."
}

variable "diagnostic_setting_enable" {
  type        = bool
  default     = false
  description = "Flag to enable diagnostic settings for the Log Analytics Workspace."
}

variable "log_analytics_workspace_id" {
  type        = string
  default     = null
  description = "The ID of an existing Log Analytics Workspace to send diagnostic data to."
}

variable "storage_account_id" {
  type        = string
  default     = null
  description = "The ID of the Storage Account where diagnostic logs should be sent."
}

variable "eventhub_name" {
  type        = string
  default     = null
  description = "The name of the Event Hub where diagnostic data should be sent."
}

variable "eventhub_authorization_rule_id" {
  type        = string
  default     = null
  description = "The ID of an Event Hub Namespace Authorization Rule used to send diagnostic data."
}

variable "metric_enabled" {
  type        = bool
  default     = true
  description = "Boolean flag to specify whether Metrics should be enabled for the Container Registry. Defaults to true."
}

variable "logs" {
  type = list(object({
    category_group = optional(string)
    category       = optional(string)
  }))
  default     = []
  description = "List of log configurations for diagnostic settings. Each object can specify either category_group or category."
}
