### Usage

You must have New Relic's account ID as well as Personal API key to use Terraform.

Terraform will read environment variables. You can set the shell to use something like this to avoid being prompted to enter details:
```
$ export TF_VAR_newrelic_account_id=<value>
$ export TF_VAR_newrelic_personal_api_key=<value>
$ export TF_VAR_newrelic_alert_email=<value>
```

Deploy:
```
$ terraform init && terraform apply
```

### Terraform New Relic Provider Documentation

See [here](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs)
