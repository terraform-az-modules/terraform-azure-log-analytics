<!-- BEGIN_TF_DOCS -->

# Azure Log Analytics Module

This example demonstrates how to use the `terraform-azure-log-analytics` module to deploy an Azure Log Analytics.

---

## ✅ Requirements

| Name      | Version   |
|-----------|-----------|
| Terraform | >= 1.6.6  |
| Azurerm   | >= 3.90.0 |

---

## 🔌 Providers

No providers are explicitly defined in this example.

---

## 📦 Modules

| Name            | Source                              | Version |
|-----------------|-------------------------------------|---------|
| resource_group  | terraform-az-modules/resource-group/azure    | 1.0.0   |
| log_analytics            | ../../                              | n/a     |

---

## 🏗️ Resources

No additional resources are directly created in this example.

---

## 🔧 Inputs

_No input variables are defined in this example._

---

## 📤 Outputs

| Name                        | Description                                                                 |
|-----------------------------|-----------------------------------------------------------------------------|
| `workspace_id`   | The ID of the Log Analytics Workspace                                          |
| `workspace_customer_id`        | The Customer ID for the Log Analytics Workspace                               |

<!-- END_TF_DOCS -->