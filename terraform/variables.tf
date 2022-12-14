variable "newrelic_account_id" {
  description = "New Relic account ID."
  type = string
}

variable "newrelic_personal_api_key" {
  description = "New Relic Personal API key to use GraphQL API."
  type = string
}

variable "newrelic_alert_email" {
  description = "Email address to send New Relic alerts to."
  type = string
}

variable "newrelic_slack_channel_id" {
  description = "Slack channel ID (not name) to send New Relic alerts to."
  type = string
}

# See https://github.com/lisenet/opsgenie-terraform
variable "opsgenie_newrelic_integration_endpoint_url" {
  description = "Endpoint URL for New Relic to post to Opsgenie"
  type = string
}
