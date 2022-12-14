resource "newrelic_synthetics_alert_condition" "main" {
  policy_id = newrelic_alert_policy.alert.id

  name        = "TF Failure www.lisenet.com"
  monitor_id  = newrelic_synthetics_monitor.main.id
  enabled     = "true"
}
