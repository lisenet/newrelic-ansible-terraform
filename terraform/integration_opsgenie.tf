resource "newrelic_notification_destination" "opsgenie" {
  name = "Opsgenie"
  type = "WEBHOOK"

  property {
    key   = "url"
    value = var.opsgenie_newrelic_integration_endpoint_url
  }

  lifecycle {
    ignore_changes = [auth_basic]
  }
}

resource "newrelic_notification_channel" "opsgenie" {
  name           = "Opsgenie"
  type           = "WEBHOOK"
  destination_id = newrelic_notification_destination.opsgenie.id
  product        = "IINT"

  property {
    key   = "payload"
    value = <<-EOT
{
  "tags": "tag1,tag2",
  "teams": "team1,team2",
  "recipients": "user1,user2",
  "payload": {
  "condition_id": {{json accumulations.conditionFamilyId.[0]}},
  "condition_name": {{json accumulations.conditionName.[0] }},
  "current_state": {{#if issueClosedAtUtc}} "closed" {{else if issueAcknowledgedAt}} "acknowledged" {{else}} "open"{{/if}},
  "details": {{json issueTitle}},
  "event_type": "Incident",
  "incident_acknowledge_url": {{json issueAckUrl }},
  "incident_api_url": "N/A",
  "incident_id": {{json issueId }},
  "incident_url": {{json issuePageUrl }},
  "owner": "N/A",
  "policy_name": {{ json accumulations.policyName.[0] }},
  "policy_url":  {{json issuePageUrl }},
  "runbook_url": {{ json accumulations.runbookUrl.[0] }},
  "severity": {{#eq "HIGH" priority}} "WARNING" {{else}}{{json priority}} {{/eq}},
  "targets": {
    "id": {{ json entitiesData.entities.[0].id }},
    "name": {{ json entitiesData.entities.[0].name }},
    "type": "{{entitiesData.entities.[0].type }}",
      "product": "{{accumulations.conditionProduct.[0]}}"
    },
    "timestamp": {{#if closedAt}} {{ closedAt }} {{else if acknowledgedAt}} {{ acknowledgedAt }} {{else}} {{ createdAt }} {{/if}}
  }
}
EOT
  }
}

resource "newrelic_workflow" "opsgenie" {
  name                  = "Opsgenie"
  enabled               = true
  muting_rules_handling = "NOTIFY_ALL_ISSUES"

  destination {
    channel_id = newrelic_notification_channel.opsgenie.id
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
