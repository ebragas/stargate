TF_DIR=terraform/

init:
	@terraform init $(TF_DIR)

plan:
	@terraform plan $(TF_DIR)

apply:
	@terraform apply $(TF_DIR)

destroy:
	@terraform destroy $(TF_DIR)
