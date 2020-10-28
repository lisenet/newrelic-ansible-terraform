# New Relic Monitoring

This repository contains a set of Ansible playbooks and Terraform files to install New Relic One agents and configure alerts.

New Relic One is a SaaS based monitoring solution that offers one full-access admin user for free.

This repository consists of:

* [`ansible`](./ansible/README.md) - Ansible configuration
* [`terraform`](./terraform/README.md) - Terraform configuration

Ansible is used to install and configure New Relic's infrastructure agents.

Terraform is used to configure New Relic's alert policies and conditions.

## Pre-requisites

### Install Ansible

Depending on your system:
```
sudo apt install ansible
sudo yum install ansible
ansible --version
```

### Install Terraform
```
wget https://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_linux_amd64.zip -O tf.zip
unzip tf.zip
sudo mv terraform /usr/local/bin/
sudo chown root: /usr/local/bin/terraform
terraform --version
```

## Usage
To deploy infrastructure agents, see [./ansible/README.md](./ansible/README.md).

To deploy Terraform config, see [./terraform/README.md](./terraform/README.md).
