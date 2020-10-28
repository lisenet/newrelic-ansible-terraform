variable "newrelic_account_id" {
  description = "Newrelic account ID."
  type = string
}

variable "newrelic_personal_api_key" {
  description = "Newrelic Personal API key to use GraphQL API."
  type = string
}

variable "newrelic_alert_email" {
  description = "Email address to send Newrelic alerts to."
  type = string
}
