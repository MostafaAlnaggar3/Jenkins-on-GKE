# FW to allow ssh

resource "google_compute_firewall" "jenkins-fw-allow-ssh" {

  name          = "jenkins-fw-allow-ssh"
  network       = google_compute_network.jenkins-vpc.name
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

}