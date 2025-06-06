output "workspace_id" {
  value       = try(azurerm_log_analytics_workspace.main[0].id, null)
  description = "The ID of the Log Analytics Workspace."
}

output "workspace_customer_id" {
  value       = try(azurerm_log_analytics_workspace.main[0].workspace_id, null)
  description = "The Workspace (or Customer) ID for the Log Analytics Workspace."
}

output "tags" {
  value       = module.labels.tags
  description = "The tags assigned to the resource."
}