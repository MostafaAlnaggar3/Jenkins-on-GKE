#==========================> FW to allow ssh

resource "google_compute_firewall" "python-app-fw-allow-ssh" {

  name          = "python-app-fw-allow-ssh"
  network       = google_compute_network.python-app-vpc.name
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

}

# ==========================> FW to denay all egress traffic for restricted targets

# resource "google_compute_firewall" "python-app-fw-denay-all" {

#   name          = "python-app-fw-denay-all"
#   network       = google_compute_network.python-app-vpc.name
#   direction     = "EGRESS"
#   source_ranges = ["0.0.0.0/0"]
#   target_tags   = ["restricted"]

#   deny {
#     protocol = "all"
#   }

# }
