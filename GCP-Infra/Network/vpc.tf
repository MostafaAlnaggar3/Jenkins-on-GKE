#==========================VPC==========================

resource "google_compute_network" "python-app-vpc" {
  name                    = "python-app-vpc"
  auto_create_subnetworks = "false"
}