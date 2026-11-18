terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# 1. Grupo de Recursos
resource "azurerm_resource_group" "rg" {
  name     = "rg-proyecto4-dw-snowflake"
  location = "East US"
}

# 2. Data Lake Storage Gen2 (ADLS Gen2)
resource "azurerm_storage_account" "datalake" {
  name                     = "dlproyecto4undc2026"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = true
}

# 3. Contenedores de la Arquitectura Medallion
resource "azurerm_storage_container" "medallion" {
  for_each              = toset(["bronze", "silver", "gold"])
  name                  = each.key
  storage_account_name  = azurerm_storage_account.datalake.name
  container_access_type = "private"
}

# 4. Azure Data Factory (Orquestador)
resource "azurerm_data_factory" "adf" {
  name                = "adf-proyecto4-dw-snowflake"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}