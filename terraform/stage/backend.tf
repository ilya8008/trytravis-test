terraform {
  backend "gcs" {
    bucket = "reddit-tf-state-stage"
    prefix = "terraform/state"
  }
}
