#==========================jenkins-VPC==========================
resource "google_compute_network" "jenkins-vpc" {
  name                    = "jenkins-vpc"
  auto_create_subnetworks = "false"
}