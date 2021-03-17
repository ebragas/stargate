# Stargate
A data export platform for both synchronous and asynchronous endpoints using GCP PaaS

## Prerequisites
* Terraform 0.14.8
    * Recommend using `tfenv`

## Setup
1. `make init` to initialize Terraform
1. `source .env` with the following variables set
    * `export TF_VAR_PROJECT_ID=<your gcp project id>`

## Local Deployment Steps
1. `make plan`
1. `make apply`

## Notes
* How will secrets get to Secret Manager?
* Use [Cloud Functions Framework](https://github.com/GoogleCloudPlatform/functions-framework-python)
* Use [Pipenv](https://realpython.com/pipenv-guide/)
    * Python 3.8
