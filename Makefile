TF_DIR=terraform/

plan:
	@terraform plan $(TF_DIR)

apply:
	@terraform apply $(TF_DIR)