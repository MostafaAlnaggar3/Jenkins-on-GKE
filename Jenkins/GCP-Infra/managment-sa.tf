# create a service account and assign a container.admin role to give the authority to management vm to communicate with GKE cluster
resource "google_service_account" "manage-sa" {
  account_id   = "manage-sa"
  display_name = "manage Service Account"
}

resource "google_project_iam_binding" "manage-sa-binding" {
  project = "mostafa-alnaggar-project"
  role    = "roles/storage.admin"
  members = ["serviceAccount:${google_service_account.manage-sa.email}"]

}

resource "google_project_iam_binding" "manage-sa-bindig-2" {
  project = "mostafa-alnaggar-project"
  role    = "roles/container.admin"
  members = ["serviceAccount:${google_service_account.manage-sa.email}"]

}