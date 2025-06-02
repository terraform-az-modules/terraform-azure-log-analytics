provider "azurerm" {
  features {}
  # subscription_id = "000000-11111-1223-XXX-XXXXXXXXXXXX"
}



# ------------------------------------------------------------------------------
# Resource Group
# ------------------------------------------------------------------------------
module "resource-group" {
  source      = "terraform-az-modules/resource-group/azure"
  version     = "1.0.0"
  name        = "example"
  environment = "test"
  location    = "northeurope"
  label_order = ["name", "environment", "location"] # locations logic are pre configured in the labels module
  # custom_name             = "" # Optional: Overrides default naming logic with a fully custom name. Cannot be used if `name` is set.
  resource_position_prefix = true # If true, resource type prefix (e.g., rg, rg-lock) is prepended to the name. Otherwise, it's appended.
}


# ------------------------------------------------------------------------------
# Log Analytics
# ------------------------------------------------------------------------------
module "log_analytics" {
  source              = "../../"
  name                = "example"
  environment         = "test"
  label_order         = ["name", "environment", "location"] # locations logic are pre configured in the labels module
  resource_group_name = module.resource-group.resource_group_name
  location            = module.resource-group.resource_group_location
}
