### Usage

You must obtain New Relic's licence key to use the `newrelic.newrelic-infra` Ansible role.

The licence key should be stored in the file `group_vars/nri-agents`. You can use Ansible vault to encrypt it.

Edit the file [`inventory`](./inventory) and add hosts that you want the New Relic's infrastructure agent installed on.

Deploy:
```
$ ansible-playbook configure-newrelic.yml
```

### New Relic Infrastructure Agent Configuration File Example

See [here](https://github.com/newrelic/infrastructure-agent/blob/master/assets/examples/infrastructure/newrelic-infra-template.yml.example)

### New Relic Ansible Documentation

See [here](https://docs.newrelic.com/docs/infrastructure/install-infrastructure-agent/config-management-tools/configure-infrastructure-agent-using-ansible).
