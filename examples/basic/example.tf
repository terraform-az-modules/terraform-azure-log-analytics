provider "azurerm" {
  features {}
}

# ------------------------------------------------------------------------------
# Log Analytics
# ------------------------------------------------------------------------------
module "log-analytics" {
  source              = "../../"
  name                = "app"
  environment         = "test"
  resource_group_name = "test"
  location            = "eastus"

  #### diagnostic setting
  log_analytics_workspace_id = "333-2343-343"
}