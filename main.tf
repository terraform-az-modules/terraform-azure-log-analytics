##-----------------------------------------------------------------------------
## Tagging Module – Applies standard tags to all resources
##-----------------------------------------------------------------------------
module "labels" {
  source          = "terraform-az-modules/tags/azure"
  version         = "1.0.0"
  name            = var.custom_name == null ? var.name : var.custom_name
  location        = var.location
  environment     = var.environment
  managedby       = var.managedby
  label_order     = var.label_order
  repository      = var.repository
  deployment_mode = var.deployment_mode
  extra_tags      = var.extra_tags
}

## -----------------------------------------------------------------------------
## Log Analytics Workspace - Deploy Log Analytics on Azure
## -----------------------------------------------------------------------------

resource "azurerm_log_analytics_workspace" "main" {
  count                      = var.enabled && var.create_log_analytics_workspace == true ? 1 : 0
  name                       = var.resource_position_prefix ? format("law-%s", local.name) : format("%s-law", local.name)
  location                   = var.location
  resource_group_name        = var.resource_group_name
  sku                        = var.log_analytics_workspace_sku
  retention_in_days          = var.retention_in_days
  daily_quota_gb             = var.daily_quota_gb
  internet_ingestion_enabled = var.internet_ingestion_enabled
  internet_query_enabled     = var.internet_query_enabled
  tags                       = module.labels.tags
}

## -----------------------------------------------------------------------------
## Diagnostic Settings for Log Analytics
## -----------------------------------------------------------------------------

resource "azurerm_monitor_diagnostic_setting" "example" {
  count                          = var.enabled && var.diagnostic_setting_enable ? 1 : 0
  name                           = var.resource_position_prefix ? format("law-diag-%s", local.name) : format("%s-law-diag", local.name)
  target_resource_id             = join("", azurerm_log_analytics_workspace.main[*].id)
  storage_account_id             = var.storage_account_id
  eventhub_name                  = var.eventhub_name
  eventhub_authorization_rule_id = var.eventhub_authorization_rule_id
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  log_analytics_destination_type = var.log_analytics_destination_type
  dynamic "enabled_log" {
    for_each = toset(var.diagnostic_setting_enabled_log_categories)
    content {
      category = enabled_log.value
    }
  }

  dynamic "metric" {
    for_each = toset(concat(local.diagnostic_setting_metric_categories, var.diagnostic_setting_enabled_metric_categories))
    content {
      category = metric.value
      enabled  = contains(var.diagnostic_setting_enabled_metric_categories, metric.value)
    }
  }
  lifecycle {
    ignore_changes = [log_analytics_destination_type]
  }
}
