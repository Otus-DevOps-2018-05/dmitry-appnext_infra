provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

module "storage-bucket" {
  source  = "SweetOps/storage-bucket/google"
  version = "0.1.1"
  name    = ["dmitry-appnext-bucket-1", "dmitry-appnext-bucket-2"]
}

output storage-bucket_url {
  value = "${module.storage-bucket.url}"
}
