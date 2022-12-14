# New Relic with Terraform

## New Relic integration with Slack

Slack destinations are created by actively interacting with the UI. This is how OAuth authentication works and there is no way to authenticate otherwise. Because of this, there is no way to create a Slack destination via Terraform, and must be created in the UI and imported into Terraform.

Use [NerdGraph explorer](https://api.eu.newrelic.com/graphiql) to list all destinations for a New Relic account:

```
{
  actor {
    account(id: YOUR_ACCOUNT_ID) {
      aiNotifications {
        destinations {
          entities {
            id
            name
          }
          error {
            details
          }
        }
      }
    }
  }
}
```

Import the resource:

```
terraform import newrelic_notification_destination.slack <destination_id>
```

## Deployment

You must have New Relic's account ID as well as Personal API key to use Terraform.

Terraform will read environment variables. You can set the shell to use something like this to avoid being prompted to enter details:

```
export TF_VAR_newrelic_account_id=<value>
export TF_VAR_newrelic_personal_api_key=<value>
export TF_VAR_newrelic_alert_email=<value>
export TF_VAR_newrelic_slack_channel_id=<value>
export TF_VAR_newrelic_opsgenie_integration_endpoint_url=<value>
```

Deploy:

```
terraform init -upgrade
terraform apply
```

### Terraform New Relic Provider Documentation

https://registry.terraform.io/providers/newrelic/newrelic/latest/docs
