output "emrserverless_applications_id" {
  description = "Map of id values across all emrserverless_applications, keyed the same as var.emrserverless_applications"
  value       = { for k, v in aws_emrserverless_application.emrserverless_applications : k => v.id if v.id != null && length(v.id) > 0 }
}
output "emrserverless_applications_architecture" {
  description = "Map of architecture values across all emrserverless_applications, keyed the same as var.emrserverless_applications"
  value       = { for k, v in aws_emrserverless_application.emrserverless_applications : k => v.architecture if v.architecture != null && length(v.architecture) > 0 }
}
output "emrserverless_applications_arn" {
  description = "Map of arn values across all emrserverless_applications, keyed the same as var.emrserverless_applications"
  value       = { for k, v in aws_emrserverless_application.emrserverless_applications : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "emrserverless_applications_auto_start_configuration" {
  description = "Map of auto_start_configuration values across all emrserverless_applications, keyed the same as var.emrserverless_applications"
  value       = { for k, v in aws_emrserverless_application.emrserverless_applications : k => v.auto_start_configuration if v.auto_start_configuration != null && length(v.auto_start_configuration) > 0 }
}
output "emrserverless_applications_auto_stop_configuration" {
  description = "Map of auto_stop_configuration values across all emrserverless_applications, keyed the same as var.emrserverless_applications"
  value       = { for k, v in aws_emrserverless_application.emrserverless_applications : k => v.auto_stop_configuration if v.auto_stop_configuration != null && length(v.auto_stop_configuration) > 0 }
}
output "emrserverless_applications_image_configuration" {
  description = "Map of image_configuration values across all emrserverless_applications, keyed the same as var.emrserverless_applications"
  value       = { for k, v in aws_emrserverless_application.emrserverless_applications : k => v.image_configuration if v.image_configuration != null && length(v.image_configuration) > 0 }
}
output "emrserverless_applications_initial_capacity" {
  description = "Map of initial_capacity values across all emrserverless_applications, keyed the same as var.emrserverless_applications"
  value       = { for k, v in aws_emrserverless_application.emrserverless_applications : k => v.initial_capacity if v.initial_capacity != null && length(v.initial_capacity) > 0 }
}
output "emrserverless_applications_interactive_configuration" {
  description = "Map of interactive_configuration values across all emrserverless_applications, keyed the same as var.emrserverless_applications"
  value       = { for k, v in aws_emrserverless_application.emrserverless_applications : k => v.interactive_configuration if v.interactive_configuration != null && length(v.interactive_configuration) > 0 }
}
output "emrserverless_applications_job_level_cost_allocation_configuration" {
  description = "Map of job_level_cost_allocation_configuration values across all emrserverless_applications, keyed the same as var.emrserverless_applications"
  value       = { for k, v in aws_emrserverless_application.emrserverless_applications : k => v.job_level_cost_allocation_configuration if v.job_level_cost_allocation_configuration != null && length(v.job_level_cost_allocation_configuration) > 0 }
}
output "emrserverless_applications_maximum_capacity" {
  description = "Map of maximum_capacity values across all emrserverless_applications, keyed the same as var.emrserverless_applications"
  value       = { for k, v in aws_emrserverless_application.emrserverless_applications : k => v.maximum_capacity if v.maximum_capacity != null && length(v.maximum_capacity) > 0 }
}
output "emrserverless_applications_monitoring_configuration" {
  description = "Map of monitoring_configuration values across all emrserverless_applications, keyed the same as var.emrserverless_applications"
  value       = { for k, v in aws_emrserverless_application.emrserverless_applications : k => v.monitoring_configuration if v.monitoring_configuration != null && length(v.monitoring_configuration) > 0 }
}
output "emrserverless_applications_name" {
  description = "Map of name values across all emrserverless_applications, keyed the same as var.emrserverless_applications"
  value       = { for k, v in aws_emrserverless_application.emrserverless_applications : k => v.name if v.name != null && length(v.name) > 0 }
}
output "emrserverless_applications_network_configuration" {
  description = "Map of network_configuration values across all emrserverless_applications, keyed the same as var.emrserverless_applications"
  value       = { for k, v in aws_emrserverless_application.emrserverless_applications : k => v.network_configuration if v.network_configuration != null && length(v.network_configuration) > 0 }
}
output "emrserverless_applications_region" {
  description = "Map of region values across all emrserverless_applications, keyed the same as var.emrserverless_applications"
  value       = { for k, v in aws_emrserverless_application.emrserverless_applications : k => v.region if v.region != null && length(v.region) > 0 }
}
output "emrserverless_applications_release_label" {
  description = "Map of release_label values across all emrserverless_applications, keyed the same as var.emrserverless_applications"
  value       = { for k, v in aws_emrserverless_application.emrserverless_applications : k => v.release_label if v.release_label != null && length(v.release_label) > 0 }
}
output "emrserverless_applications_runtime_configuration" {
  description = "Map of runtime_configuration values across all emrserverless_applications, keyed the same as var.emrserverless_applications"
  value       = { for k, v in aws_emrserverless_application.emrserverless_applications : k => v.runtime_configuration if v.runtime_configuration != null && length(v.runtime_configuration) > 0 }
}
output "emrserverless_applications_scheduler_configuration" {
  description = "Map of scheduler_configuration values across all emrserverless_applications, keyed the same as var.emrserverless_applications"
  value       = { for k, v in aws_emrserverless_application.emrserverless_applications : k => v.scheduler_configuration if v.scheduler_configuration != null && length(v.scheduler_configuration) > 0 }
}
output "emrserverless_applications_tags" {
  description = "Map of tags values across all emrserverless_applications, keyed the same as var.emrserverless_applications"
  value       = { for k, v in aws_emrserverless_application.emrserverless_applications : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "emrserverless_applications_tags_all" {
  description = "Map of tags_all values across all emrserverless_applications, keyed the same as var.emrserverless_applications"
  value       = { for k, v in aws_emrserverless_application.emrserverless_applications : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "emrserverless_applications_type" {
  description = "Map of type values across all emrserverless_applications, keyed the same as var.emrserverless_applications"
  value       = { for k, v in aws_emrserverless_application.emrserverless_applications : k => v.type if v.type != null && length(v.type) > 0 }
}

