variable "project_id" {
    type = string
    description = "ID of the GCP project to deploy to. Set with env var."
}

variable "location_id" {
    type = string
    default = "us-central"
}

variable "region" {
    type = string
    default = "us-central1"
}

variable "zone" {
    type = string
    default = "us-central1-c"
}
