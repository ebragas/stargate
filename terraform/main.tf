terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.60.0"
    }
  }
}

provider "google" {
  project = var.PROJECT_ID
  region  = "us-central1"
  zone    = "us-central1-c"
}

