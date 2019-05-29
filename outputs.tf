output "app_service_plan_id" {
    value       = "${azurerm_app_service_plan.webapp.id}"
    description = "The ID of the App Service Plan component."    
}

output "app_service_plan_name" {
    value       = "${azurerm_app_service_plan.webapp.name}"
    description = "The name of the App Service Plan component/"
}

output "webapp_name" {
    value       = "${azurerm_app_service.webapp.name}"
    description = "The name of the App Service."
}

output "hostname" {
    value       = "${azurerm_app_service.webapp.default_site_hostname}"
    description = "The Default Hostname associated with the App Service."
}

output "outbound_ip_addressess" {
    value       = "${azurerm_app_service.webapp.outbound_ip_addresses}"
    description = "A comma separated list of outbound IP addresses."
}

output "source_control" {
    value       = "${azurerm_app_service.webapp.source_control}"
    description = "A source_control block as defined below, which contains the Source Control information when scm_type is set to LocalGit."
}

output "webapp_slot_name" {
    value       = "${azurerm_app_service_slot.webapp.*.name}"
    description = "The name of the App Service Slot."
}

output "webapp_slot_id" {
    value       = "${azurerm_app_service_slot.webapp.*.id}"
    description = "The ID of the App Service Slot."
}

output "slot_hostname" {
    value       = "${azurerm_app_service_slot.webapp.*.default_site_hostname}"
    description = "The Default Hostname associated with the App Service Slot."
}
