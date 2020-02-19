terraform {
  backend "gcs" {
    bucket = "storage-bucket-otus-agapov"
    prefix = "terraform-stage"
  }
}