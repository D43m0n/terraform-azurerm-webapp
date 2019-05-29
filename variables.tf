# Default variables, usually always present in a module of our making.

variable "resource_group" {
  default     = "webapp-rg"
  description = "The name of the resource group in which to create the MySQL Server. Changing this forces a new resource to be created."
}

variable "prefix" {
  default     = ""
  description = "An optional prefix to use in naming schemes, sometimes unique names are required."
}

variable "my_environment" {
  default     = "production"
  description = "An environment might have implications on naming schemes, or deployment options."
}

variable "envname" {
  type    = "map" 
  default = {
    "production" = ""
    "development" = "-dev"
    "accept" = "-acc"
    "test" = "-tst"
  }
  description = "This environment name map constructs the name of the resource to be created."
}

variable "location" {
  default     = "westeurope"
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "tags" {
  type    = "map"
  default = {
    "Project" = "Some project nr. 010011"
  }
  description = "A mapping of tags to assign to the resource. For instance business stakeholders, or who pays for it?"
}

variable "create_lock" {
  default     = true
  description = "Whether to lock the resource group or not. true enables the lock, false does not lock the resource group."
}

variable "resource_lock_name" {
  default     = "lock-on-resource-group"
  description = "Specifies the name of the Management Lock. Changing this forces a new resource to be created."
}

variable "lock_level" {
  default     = "CanNotDelete"
  description = "Specifies the Level to be used for this Lock. Possible values are CanNotDelete and ReadOnly. Changing this forces a new resource to be created."
}

variable "notes" {
  default     = "This Resource Group is locked to prevent unintended deletion."
  description = "Specifies some notes about the lock. Maximum of 512 characters. Changing this forces a new resource to be created."
}

# Module specific variables

variable "app_service_plan_name" {
  default     = "-plan"
  description = "Specifies the name of the App Service Plan component. Changing this forces a new resource to be created."
}

variable "sku_tier" {
  default     = "Standard"
  description = "Specifies the plan's pricing tier."
}

variable "sku_size" {
  default     = "S1"
  description = "Specifies the plan's instance size."
}

variable "app_service_plan_kind" {
  default     = "Windows"
  description = "The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). Defaults to Windows. Changing this forces a new resource to be created."
}

variable "app_service_plan_reserved" {
  default     = false
  description = "Is this App Service Plan Reserved. Defaults to false. When creating a Linux App Service Plan, the reserved field must be set to true."
}

variable "per_site_scaling" {
  default     = false
  description = "Can Apps assigned to this App Service Plan be scaled independently? If set to false apps assigned to this plan will scale to all instances of the plan. Defaults to false."
}

variable "app_service_name" {
  description = "Specifies the name of the App Service. Changing this forces a new resource to be created."
}

variable "always_on" {
  default     = false
  description = "Should the app be loaded at all times? Defaults to false."
}

variable "http2_enabled" {
  default     = false
  description = " Is HTTP2 Enabled on this App Service? Defaults to false."
}

variable "dotnet_framework_version" {
  default     = ""
  description = "The version of the .net framework's CLR used in this App Service. Possible values are v2.0 (which will use the latest version of the .net framework for the .net CLR v2 - currently .net 3.5) and v4.0 (which corresponds to the latest version of the .net CLR v4 - which at the time of writing is .net 4.7.1)."
}

variable "java_version" {
  default     = ""
  description = "The version of Java to use. If specified java_container and java_container_version must also be specified. Possible values are 1.7, 1.8 and 11."
}

variable "java_container" {
  default     = ""
  description = "The Java Container to use. If specified java_version and java_container_version must also be specified. Possible values are JETTY and TOMCAT."
}

variable "java_container_version" {
  default     = ""
  description = "The version of the Java Container to use. If specified java_version and java_container must also be specified."
}

variable "linux_fx_version" {
  default     = ""
  description = " Linux App Framework and version for the App Service. Possible options are a Docker container (DOCKER|<user/image:tag>), a base-64 encoded Docker Compose file (COMPOSE|${filebase64("compose.yml")}) or a base-64 encoded Kubernetes Manifest (KUBE|${filebase64("kubernetes.yml")})."
}

variable "min_tls_version" {
  default     = "1.2"
  description = "The minimum supported TLS version for the app service. Possible values are 1.0, 1.1, and 1.2. Defaults to 1.2 for new app services."
}

variable "php_version" {
  default     = ""
  description = "The version of PHP to use in this App Service. Possible values are 5.5, 5.6, 7.0, 7.1 and 7.2."
}
    
variable "python_version" {
  default     = ""
  description = "The version of Python to use in this App Service. Possible values are 2.7 and 3.4."
}

variable "remote_debugging_enabled" {
  default     = false
  description = "Is Remote Debugging Enabled? Defaults to false."
}

variable "remote_debugging_version" {
  default     = ""
  description = "Which version of Visual Studio should the Remote Debugger be compatible with? Possible values are VS2012, VS2013, VS2015 and VS2017."
}

variable "scm_type" {
  default     = ""
  description = "The type of Source Control enabled for this App Service. Defaults to None. Possible values are: BitbucketGit, BitbucketHg, CodePlexGit, CodePlexHg, Dropbox, ExternalGit, ExternalHg, GitHub, LocalGit, None, OneDrive, Tfs, VSO and VSTSRM"
}

variable "virtual_network_name" {
  default     = ""
  description = "The name of the Virtual Network which this App Service should be attached to."
}

variable "websockets_enabled" {
  default     = false
  description = "Should WebSockets be enabled?"
}

variable "restrict_ip" {
  default     = "0.0.0.0"
  description = "The IP Address used for this IP Restriction."
}

variable "restrict_subnet_mask" {
  default     = "0.0.0.0"
  description = "The Subnet mask used for this IP Restriction. Defaults to 0.0.0.0 (every ip allowed)"
}

variable "connection_string_name" {
  description = "The name of the Connection String."
}

variable "connection_string_type" {
  description = "The type of the Connection String. Possible values are APIHub, Custom, DocDb, EventHub, MySQL, NotificationHub, PostgreSQL, RedisCache, ServiceBus, SQLAzure and SQLServer."
}

variable "connection_string_value" {
  description = "The value for the Connection String."
}

variable "use_custom_hostname" {
  default     = false
  description = "Whether to use a custom hostname or not. Defaults to not."
}

variable "custom_hostname" {
  default     = ""
  description = "Specifies the Custom Hostname to use for the App Service, example www.example.com. Changing this forces a new resource to be created."
}

# Note: Deployment Slots are not supported in the Free, Shared, or Basic App Service Plans.
# Note: When using Slots - the app_settings, connection_string and site_config blocks on the azurerm_app_service resource will be overwritten when promoting a Slot using the azurerm_app_service_active_slot resource.
variable "create_app_service_slot" {
  default     = false
  description = "Whether to create an app service slot or not. Defaults to not."
}

variable "app_service_slot_name" {
  default     = "-staging"
  description = "Specifies the name of the App Service Slot component. Changing this forces a new resource to be created."
}

variable "restrict_ip_app_service_slot" {
  default     = "0.0.0.0"
  description = "The IP Address used for this IP Restriction."
}

variable "restrict_subnet_mask_app_service_slot" {
  default     = "0.0.0.0"
  description = "The Subnet mask used for this IP Restriction. Defaults to 0.0.0.0 (every ip allowed)"
}

variable "connection_string_name_app_service_slot" {
  description = "The name of the Connection String."
}

variable "connection_string_type_app_service_slot" {
  description = "The type of the Connection String. Possible values are APIHub, Custom, DocDb, EventHub, MySQL, NotificationHub, PostgreSQL, RedisCache, ServiceBus, SQLAzure and SQLServer."
}

variable "connection_string_value_app_service_slot" {
  description = "The value for the Connection String."
}
