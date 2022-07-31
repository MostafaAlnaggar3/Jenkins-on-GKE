# Manegment instace
resource "google_compute_instance" "python-app-management-vm" {
  name         = "python-app-management-vm"
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
    network    = module.Network.python-app-vpc-name
    subnetwork = module.Network.python-app-managment-subnet-name
  }
}
