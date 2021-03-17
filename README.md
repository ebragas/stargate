# Stargate
A data export platform for both synchronous and asynchronous endpoints using GCP PaaS

## Prerequisites
* Terraform 0.14.8

## Local Deployment Steps
1. `source .env` with the following variables set
    * `TF_VAR_PROJECT_ID=<your gcp project id>`
1. Run terraform plan, terraform apply
    * How will secrets get to Secret Manager?

## Notes
* Use [Cloud Functions Framework](https://github.com/GoogleCloudPlatform/functions-framework-python)
* Use [Pipenv](https://realpython.com/pipenv-guide/)
    * Python 3.8
