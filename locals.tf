## -----------------------------------------------------------------------------
## Locals
## -----------------------------------------------------------------------------
locals {
  name                                 = var.custom_name != null ? var.custom_name : module.labels.id
  diagnostic_setting_metric_categories = ["AllMetrics"]
}