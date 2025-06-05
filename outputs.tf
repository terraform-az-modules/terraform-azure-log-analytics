output "workspace_id" {
  value       = var.create_log_analytics_workspace == true ? join("", azurerm_log_analytics_workspace.main[*].id) : null
  description = "The ID of the Log Analytics Workspace."
}

output "workspace_customer_id" {
  value       = var.create_log_analytics_workspace == true ? join("", azurerm_log_analytics_workspace.main[*].workspace_id) : null
  description = "The Workspace (or Customer) ID for the Log Analytics Workspace."
}


output "tags" {
  value       = module.labels.tags
  description = "The tags assigned to the resource."
}