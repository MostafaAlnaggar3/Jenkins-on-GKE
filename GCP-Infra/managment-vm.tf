# Manegment instace "jenkins-slave"
resource "google_compute_instance" "jenkins-management-vm" {
  name         = "jenkin-smanagement-vm"
  machine_type = "e2-medium"
  zone         = "${var.region}-b"

  service_account {
    email  = google_service_account.manage-sa.email
    scopes = ["cloud-platform"]
  }

  boot_disk {
    initialize_params {
      image = var.image-id
    }
  }

  network_interface {
    network    = module.Network.jenkins-vpc-name
    subnetwork = module.Network.jenkins-managment-subnet-name
  }
}
