##-----------------------------------------------------------------------------
## Log Analytics
##-----------------------------------------------------------------------------
output "workspace_id" {
  value       = module.log_analytics.workspace_id
  description = "The ID of the Log Analytics Workspace."
}

output "workspace_customer_id" {
  value       = module.log_analytics.workspace_customer_id
  description = "The Workspace (or Customer) ID for the Log Analytics Workspace."
}