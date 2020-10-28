# Create an alert policy
resource "newrelic_alert_policy" "alert" {
  name = "TF_Monitoring_Policy"
  incident_preference = "PER_CONDITION_AND_TARGET" # PER_POLICY is default
}

# Create an email alert channel
resource "newrelic_alert_channel" "email" {
  name = "TF_Email"
  type = "email"

  config {
    recipients              = var.newrelic_alert_email
    include_json_attachment = "0"
  }
}

# Link the channel to the policy
resource "newrelic_alert_policy_channel" "alert_email" {
  policy_id  = newrelic_alert_policy.alert.id
  channel_ids = [
    newrelic_alert_channel.email.id
  ]
}
