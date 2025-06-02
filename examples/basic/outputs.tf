
##-----------------------------------------------------------------------------
## Tags  
##-----------------------------------------------------------------------------
output "tags" {
  value       = module.log_analytics.tags
  description = "A mapping of tags which should be assigned to the Log Analytics."
}