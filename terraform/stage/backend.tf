terraform {
  backend "gcs" {
    bucket  = "dmitry-appnext-bucket-1"
    prefix  = "terraform/state"
  }
}