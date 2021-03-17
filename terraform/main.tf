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
  region  = var.region
  zone    = var.zone
}

# required for cloud tasks
resource "google_app_engine_application" "app_engine" {
  project = var.project_id
  location_id = var.location_id
}

resource "google_cloud_tasks_queue" "default_queue" {
  # TODO: add unique id to name
  name     = "cloud-tasks-queue-test2"
  location = var.region

  # not currently implied
  depends_on = [
    google_project_service.cloud_tasks_api
  ]
}