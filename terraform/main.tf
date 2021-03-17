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

resource "google_storage_bucket" "outgoing_bucket" {
  name          = "${var.project_id}-outgoing"
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = true
}

resource "google_storage_notification" "notification" {
  bucket         = google_storage_bucket.outgoing_bucket.name
  payload_format = "JSON_API_V1"
  topic          = google_pubsub_topic.new_outgoing_topic.id
  event_types    = ["OBJECT_FINALIZE"]
  depends_on = [google_pubsub_topic_iam_binding.binding]
}

resource "google_pubsub_topic" "new_outgoing_topic" {
  name = "new-outgoing"
}

// Enable notifications by giving the correct IAM permission to the unique service account.
data "google_storage_project_service_account" "gcs_account" {
}

resource "google_pubsub_topic_iam_binding" "binding" {
  topic   = google_pubsub_topic.new_outgoing_topic.id
  role    = "roles/pubsub.publisher"
  members = ["serviceAccount:${data.google_storage_project_service_account.gcs_account.email_address}"]
}
