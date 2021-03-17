terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.60.0" # explicit to avoid unexpected breaking changes
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_cloud_tasks_queue" "default_queue" {
  name     = "cloud-tasks-queue-test"
  location = "us-central1"
}