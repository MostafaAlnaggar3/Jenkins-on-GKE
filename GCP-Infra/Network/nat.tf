resource "google_compute_router" "jenkins-router" {

  name    = "jenkins-router"
  region  = var.region
  network = google_compute_network.jenkins-vpc.name

}

resource "google_compute_router_nat" "jenkins-nat" {
  
  name   = "jenkins-nat"
  region = var.region
  router = google_compute_router.jenkins-router.name
  nat_ip_allocate_option = "AUTO_ONLY"

  # to define subnet which will have this nat
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = google_compute_subnetwork.jenkins-managment-subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  subnetwork {
    name                    = google_compute_subnetwork.jenkins-restricted-subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

}
