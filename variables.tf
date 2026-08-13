variable "emrserverless_applications" {
  description = <<EOT
Map of emrserverless_applications, attributes below
Required:
    - name
    - release_label
    - type
Optional:
    - architecture
    - region
    - tags
    - tags_all
    - auto_start_configuration (block):
        - enabled (optional)
    - auto_stop_configuration (block):
        - enabled (optional)
        - idle_timeout_minutes (optional)
    - image_configuration (block):
        - image_uri (required)
    - initial_capacity (block):
        - initial_capacity_config (optional, block):
            - worker_configuration (optional, block):
                - cpu (required)
                - disk (optional)
                - memory (required)
            - worker_count (required)
        - initial_capacity_type (required)
    - interactive_configuration (block):
        - livy_endpoint_enabled (optional)
        - studio_enabled (optional)
    - job_level_cost_allocation_configuration (block):
        - enabled (optional)
    - maximum_capacity (block):
        - cpu (required)
        - disk (optional)
        - memory (required)
    - monitoring_configuration (block):
        - cloudwatch_logging_configuration (optional, block):
            - enabled (required)
            - encryption_key_arn (optional)
            - log_group_name (optional)
            - log_stream_name_prefix (optional)
            - log_types (optional, block):
                - name (required)
                - values (required)
        - managed_persistence_monitoring_configuration (optional, block):
            - enabled (optional)
            - encryption_key_arn (optional)
        - prometheus_monitoring_configuration (optional, block):
            - remote_write_url (optional)
        - s3_monitoring_configuration (optional, block):
            - encryption_key_arn (optional)
            - log_uri (optional)
    - network_configuration (block):
        - security_group_ids (optional)
        - subnet_ids (optional)
    - runtime_configuration (block):
        - classification (required)
        - properties (optional)
    - scheduler_configuration (block):
        - max_concurrent_runs (optional)
        - queue_timeout_minutes (optional)
EOT

  type = map(object({
    name          = string
    release_label = string
    type          = string
    architecture  = optional(string)
    region        = optional(string)
    tags          = optional(map(string))
    tags_all      = optional(map(string))
    auto_start_configuration = optional(object({
      enabled = optional(bool)
    }))
    auto_stop_configuration = optional(object({
      enabled              = optional(bool)
      idle_timeout_minutes = optional(number)
    }))
    image_configuration = optional(object({
      image_uri = string
    }))
    initial_capacity = optional(list(object({
      initial_capacity_config = optional(object({
        worker_configuration = optional(object({
          cpu    = string
          disk   = optional(string)
          memory = string
        }))
        worker_count = number
      }))
      initial_capacity_type = string
    })))
    interactive_configuration = optional(object({
      livy_endpoint_enabled = optional(bool)
      studio_enabled        = optional(bool)
    }))
    job_level_cost_allocation_configuration = optional(object({
      enabled = optional(bool)
    }))
    maximum_capacity = optional(object({
      cpu    = string
      disk   = optional(string)
      memory = string
    }))
    monitoring_configuration = optional(object({
      cloudwatch_logging_configuration = optional(object({
        enabled                = bool
        encryption_key_arn     = optional(string)
        log_group_name         = optional(string)
        log_stream_name_prefix = optional(string)
        log_types = optional(list(object({
          name   = string
          values = set(string)
        })))
      }))
      managed_persistence_monitoring_configuration = optional(object({
        enabled            = optional(bool)
        encryption_key_arn = optional(string)
      }))
      prometheus_monitoring_configuration = optional(object({
        remote_write_url = optional(string)
      }))
      s3_monitoring_configuration = optional(object({
        encryption_key_arn = optional(string)
        log_uri            = optional(string)
      }))
    }))
    network_configuration = optional(object({
      security_group_ids = optional(set(string))
      subnet_ids         = optional(set(string))
    }))
    runtime_configuration = optional(list(object({
      classification = string
      properties     = optional(map(string))
    })))
    scheduler_configuration = optional(object({
      max_concurrent_runs   = optional(number)
      queue_timeout_minutes = optional(number)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.emrserverless_applications : (
        v.auto_stop_configuration == null || (v.auto_stop_configuration.idle_timeout_minutes == null || (v.auto_stop_configuration.idle_timeout_minutes >= 1 && v.auto_stop_configuration.idle_timeout_minutes <= 10080))
      )
    ])
    error_message = "must be between 1 and 10080"
  }
  validation {
    condition = alltrue([
      for k, v in var.emrserverless_applications : (
        v.initial_capacity == null || alltrue([for item in v.initial_capacity : (item.initial_capacity_config == null || (item.initial_capacity_config.worker_count >= 1 && item.initial_capacity_config.worker_count <= 1000000))])
      )
    ])
    error_message = "must be between 1 and 1000000"
  }
  validation {
    condition = alltrue([
      for k, v in var.emrserverless_applications : (
        v.monitoring_configuration == null || (v.monitoring_configuration.cloudwatch_logging_configuration == null || (v.monitoring_configuration.cloudwatch_logging_configuration.log_stream_name_prefix == null || (length(v.monitoring_configuration.cloudwatch_logging_configuration.log_stream_name_prefix) >= 1 && length(v.monitoring_configuration.cloudwatch_logging_configuration.log_stream_name_prefix) <= 512)))
      )
    ])
    error_message = "must be between 1 and 512 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.emrserverless_applications : (
        v.monitoring_configuration == null || (v.monitoring_configuration.s3_monitoring_configuration == null || (v.monitoring_configuration.s3_monitoring_configuration.log_uri == null || (length(v.monitoring_configuration.s3_monitoring_configuration.log_uri) >= 1 && length(v.monitoring_configuration.s3_monitoring_configuration.log_uri) <= 10280)))
      )
    ])
    error_message = "must be between 1 and 10280 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.emrserverless_applications : (
        v.scheduler_configuration == null || (v.scheduler_configuration.max_concurrent_runs == null || (v.scheduler_configuration.max_concurrent_runs >= 1 && v.scheduler_configuration.max_concurrent_runs <= 1000))
      )
    ])
    error_message = "must be between 1 and 1000"
  }
  validation {
    condition = alltrue([
      for k, v in var.emrserverless_applications : (
        v.scheduler_configuration == null || (v.scheduler_configuration.queue_timeout_minutes == null || (v.scheduler_configuration.queue_timeout_minutes >= 15 && v.scheduler_configuration.queue_timeout_minutes <= 720))
      )
    ])
    error_message = "must be between 15 and 720"
  }
  # Note: 7 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

