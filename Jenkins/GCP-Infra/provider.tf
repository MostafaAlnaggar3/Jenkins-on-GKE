
provider "google" {
  credentials = "/home/mostafa-alnaggar/.config/gcloud/application_default_credentials.json"
  project     = "mostafa-alnaggar-project"
  region      = var.region
}