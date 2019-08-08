resource "google_storage_bucket" "bucket" {
  name          = "${var.bucket_prefix}${var.project}"
  location      = var.region
  project       = var.project
  storage_class = var.storage_class

  versioning {
    enabled = true
  }
}

resource "google_service_account" "service_account" {
  account_id   = var.service_account_id
  display_name = var.service_account_name
  project      = var.project
}

resource "google_service_account_key" "key" {
  service_account_id = google_service_account.service_account.name
}

data "google_service_account_key" "key" {
  name            = "${google_service_account_key.key.name}"
  public_key_type = "TYPE_X509_PEM_FILE"
}

resource "google_project_iam_member" "project" {
  project = var.project
  role    = "roles/cloudasset.viewer"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_storage_bucket_iam_member" "member" {
  bucket = google_storage_bucket.bucket.name
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.service_account.email}"
}
