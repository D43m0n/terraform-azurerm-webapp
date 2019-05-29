resource "azurerm_resource_group" "webapp" {
  name     = "${local.name_prefix}${var.resource_group}${local.name_suffix}"
  location = "${var.location}"
  tags     = "${var.tags}"
}

resource "azurerm_management_lock" "conditional" {
  count      = "${var.create_lock ? 1 : 0}"
  name       = "${var.resource_lock_name}"
  scope      = "${azurerm_resource_group.webapp.id}"
  lock_level = "${var.lock_level}"
  notes      = "${var.notes}"
}

resource "azurerm_app_service_plan" "webapp" {
  name                = "${local.name_prefix}${var.app_service_plan_name}${local.name_suffix}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.webapp.name}"
  kind                = "${var.app_service_plan_kind}"
  reserved            = "${var.app_service_plan_reserved}"
  per_site_scaling    = "${var.per_site_scaling}"

  sku {
    tier = "${var.sku_tier}"
    size = "${var.sku_size}"
  }
}

resource "azurerm_app_service" "webapp" {
  name                = "${local.name_prefix}${var.app_service_name}${local.name_suffix}"
  location            = "${azurerm_resource_group.webapp.location}"
  resource_group_name = "${azurerm_resource_group.webapp.name}"
  app_service_plan_id = "${azurerm_app_service_plan.webapp.id}"

  site_config {
    always_on                = "${var.always_on}"
    http2_enabled            = "${var.http2_enabled}"
    dotnet_framework_version = "${var.dotnet_framework_version}"
    java_version             = "${var.java_version}"
    java_container           = "${var.java_container}"
    java_container_version   = "${var.java_container_version}"
    linux_fx_version         = "${var.linux_fx_version}"
    min_tls_version          = "${var.min_tls_version}"
    php_version              = "${var.php_version}"
    python_version           = "${var.python_version}"
    remote_debugging_enabled = "${var.remote_debugging_enabled}"
    remote_debugging_version = "${var.remote_debugging_version}"
    scm_type                 = "${var.scm_type}"
    virtual_network_name     = "${var.virtual_network_name}"
    websockets_enabled       = "${var.websockets_enabled}"

    ip_restriction {
      ip_address  = "${var.restrict_ip}"
      subnet_mask = "${var.restrict_subnet_mask}"
    }
  }

  connection_string {
    name  = "${local.name_prefix}${var.connection_string_name}${local.name_suffix}"
    type  = "${var.connection_string_type}"
    value = "${var.connection_string_value}"
  }
}

resource "azurerm_app_service_custom_hostname_binding" "webapp" {
  count               = "${var.use_custom_hostname ? 1 : 0}"
  hostname            = "${var.custom_hostname}"
  app_service_name    = "${azurerm_app_service.webapp.name}"
  resource_group_name = "${azurerm_resource_group.webapp.name}"
}

resource "azurerm_app_service_slot" "webapp" {
  count               = "${var.create_app_service_slot ? 1 : 0}"
  name                = "${azurerm_app_service.webapp.name}${var.app_service_slot_name}"
  app_service_name    = "${azurerm_app_service.webapp.name}"
  location            = "${azurerm_resource_group.webapp.location}"
  resource_group_name = "${azurerm_resource_group.webapp.name}"
  app_service_plan_id = "${azurerm_app_service_plan.webapp.id}"

  site_config {
    always_on                = "${var.always_on}"
    http2_enabled            = "${var.http2_enabled}"
    dotnet_framework_version = "${var.dotnet_framework_version}"
    java_version             = "${var.java_version}"
    java_container           = "${var.java_container}"
    java_container_version   = "${var.java_container_version}"
    linux_fx_version         = "${var.linux_fx_version}"
    min_tls_version          = "${var.min_tls_version}"
    php_version              = "${var.php_version}"
    python_version           = "${var.python_version}"
    remote_debugging_enabled = "${var.remote_debugging_enabled}"
    remote_debugging_version = "${var.remote_debugging_version}"
    scm_type                 = "${var.scm_type}"
    virtual_network_name     = "${var.virtual_network_name}"
    websockets_enabled       = "${var.websockets_enabled}"

    ip_restriction {
      ip_address  = "${var.restrict_ip_app_service_slot}"
      subnet_mask = "${var.restrict_subnet_mask_app_service_slot}"
    }
  }

  connection_string {
    name  = "${local.name_prefix}${var.connection_string_name_app_service_slot}${local.name_suffix}"
    type  = "${var.connection_string_type_app_service_slot}"
    value = "${var.connection_string_value_app_service_slot}"
  }
}
