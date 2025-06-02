##-----------------------------------------------------------------------------
## Log Analytics 
##-----------------------------------------------------------------------------

output "workspace_id" {
  value = var.create_log_analytics_workspace == true ? join("", azurerm_log_analytics_workspace.main[*].id) : null
}

output "workspace_customer_id" {
  value = var.create_log_analytics_workspace == true ? join("", azurerm_log_analytics_workspace.main[*].workspace_id) : null
}

##-----------------------------------------------------------------------------
## Tags  
##-----------------------------------------------------------------------------
output "tags" {
  value       = try(module.labels.tags, null)
  description = "A mapping of tags which should be assigned to the Log Analytics."
}