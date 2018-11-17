terraform {
  backend "gcs" {
    bucket = "reddit-tf-state-prod"
    prefix = "terraform/state"
  }
}
