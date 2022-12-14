resource "newrelic_synthetics_multilocation_alert_condition" "main" {
  policy_id = newrelic_alert_policy.alert.id

  name        = "TF Failure ${var.website_fqdn_to_monitor}"
  enabled     = true

  runbook_url                  = "https://${var.website_fqdn_to_monitor}"
  violation_time_limit_seconds = "86400"

  entities = [
    newrelic_synthetics_monitor.main.id
  ]

  critical {
    threshold = 2
  }

  warning {
    threshold = 1
  }
}
