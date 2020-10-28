# Use this resource to create and manage synthetics alert conditions
data "newrelic_synthetics_monitor" "web_lsn" {
  name       = "www.lisenet.com_tf"
  depends_on = [newrelic_synthetics_monitor.web_lsn]
}
resource "newrelic_synthetics_alert_condition" "web_lsn_failure" {
  policy_id = newrelic_alert_policy.alert.id

  name        = "TF Failure www.lisenet.com"
  monitor_id  = data.newrelic_synthetics_monitor.web_lsn.id
  enabled     = "true"

  depends_on  = [newrelic_synthetics_monitor.web_lsn]
}
