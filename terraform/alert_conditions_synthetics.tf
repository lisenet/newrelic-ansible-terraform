resource "newrelic_synthetics_alert_condition" "web_lsn_failure" {
  policy_id = newrelic_alert_policy.alert.id

  name        = "TF Failure www.lisenet.com"
  monitor_id  = newrelic_synthetics_monitor.web_lsn.id
  enabled     = "true"
}
