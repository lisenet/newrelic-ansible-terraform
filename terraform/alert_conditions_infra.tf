# Add a condition for host not reporting
resource "newrelic_infra_alert_condition" "host_not_reporting" {
  policy_id = newrelic_alert_policy.alert.id

  name    = "TF Host not reporting"
  type    = "infra_host_not_reporting"
  enabled = "true"

  critical {
    duration = 5
  }
}

# Add a condition for disk usage
resource "newrelic_infra_alert_condition" "disk_used" {
  policy_id = newrelic_alert_policy.alert.id

  name       = "TF Disk Used above 90%"
  type       = "infra_metric"
  event      = "StorageSample"
  select     = "diskUsedPercent"
  comparison = "above"
  enabled    = "true"

  critical {
    duration      = 30
    value         = 90
    time_function = "all"
  }
  warning {
    duration      = 30
    value         = 85
    time_function = "all"
  }
}

# Add a condition for high CPU usage
resource "newrelic_infra_alert_condition" "cpu_at_100_percent" {
  policy_id = newrelic_alert_policy.alert.id

  name       = "TF CPU at 100%"
  type       = "infra_metric"
  event      = "SystemSample"
  select     = "cpuPercent"
  comparison = "equal"
  enabled    = "true"

  critical {
    duration      = 60
    value         = 100
    time_function = "all"
  }
  warning {
    duration      = 30
    value         = 100
    time_function = "all"
  }
}
