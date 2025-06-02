##-----------------------------------------------------------------------------
## Log Analytics
##-----------------------------------------------------------------------------
output "workspace_id" {
  value = module.log_analytics.workspace_customer_id
}

output "workspace_customer_id" {
  value = module.log_analytics.workspace_customer_id
}

##-----------------------------------------------------------------------------
## Tags  
##-----------------------------------------------------------------------------
output "tags" {
  value       = module.log_analytics.tags
  description = "A mapping of tags which should be assigned to the Log Analytics."
}