TF_DIR=terraform/

init:
	@terraform init $(TF_DIR)

import-app-engine:
	terraform import google_app_engine_application.app_engine $(gcloud config get-value project)

plan:
	@terraform plan $(TF_DIR)

apply:
	@terraform apply $(TF_DIR)

destroy:
	@terraform destroy $(TF_DIR)
