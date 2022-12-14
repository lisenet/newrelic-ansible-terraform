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

```
sudo apt install -y python3 python3-pip
python3 -m pip install --user ansible==4.10
```

### Install Terraform

```
sudo apt install -y curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt install -y terraform=1.3.4
sudo apt-mark hold terraform
```

### Configure AWS S3 and DynamoDB for Remote State Files

See configuration instructions here:

https://www.lisenet.com/2020/terraform-with-aws-s3-and-dynamodb-for-remote-state-files/

See required IAM account permissions [docs/terraform-aws-iam-permissions.json](./docs/terraform-aws-iam-permissions.json).

## Usage
To deploy infrastructure agents, see [./ansible/README.md](./ansible/README.md).

To deploy Terraform config, see [./terraform/README.md](./terraform/README.md).
