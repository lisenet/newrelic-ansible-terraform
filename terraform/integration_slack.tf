# See https://discuss.newrelic.com/t/cant-create-slack-alert-channels-lexical-error-invalid-char-in-json-text/
# Slack destinations are created by actively interacting with the UI.
# This is how OAuth authentication works and there is no way to 
# authenticate otherwise. Because of this, there is no way to create
# a slack destination via terraform, and must be created in the UI 
# and imported into terraform.

resource "newrelic_notification_destination" "slack" {
  name = "Lisenet"
  type = "SLACK"

  property {
    key   = "scope"
    label = "Permissions"
    value = "app_mentions:read,channels:join,channels:read,chat:write,chat:write.public,commands,groups:read,links:read,links:write,team:read,users:read"
  }
  property {
    key   = "teamName"
    label = "Team Name"
    value = "Lisenet"
  }

  lifecycle {
    ignore_changes = [auth_token]
  }
}

resource "newrelic_notification_channel" "slack" {
  name = "Slack"
  type = "SLACK"
  destination_id = newrelic_notification_destination.slack.id
  product = "IINT"

  property {
    key = "channelId"
    value = var.newrelic_slack_channel_id
  }
}

resource "newrelic_workflow" "slack" {
  name                  = "Slack"
  enabled               = true
  muting_rules_handling = "NOTIFY_ALL_ISSUES"

  destination {
    channel_id = newrelic_notification_channel.slack.id
  }

  issues_filter {
    name = "alerts"
    type = "FILTER"

    predicate {
      attribute = "labels.policyIds"
      operator  = "EXACTLY_MATCHES"
      values    = [newrelic_alert_policy.alert.id, ]
    }
  }
}
