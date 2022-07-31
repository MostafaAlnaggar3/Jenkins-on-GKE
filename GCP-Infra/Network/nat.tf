resource "google_compute_router" "python-app-router" {

  name    = "python-app-router"
  region  = var.region
  network = google_compute_network.python-app-vpc.name

}

resource "google_compute_router_nat" "python-app-nat" {
  
  name   = "python-app-nat"
  region = var.region
  router = google_compute_router.python-app-router.name
  nat_ip_allocate_option = "AUTO_ONLY"

  # to define subnet which will have this nat
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = google_compute_subnetwork.python-app-managment-subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  subnetwork {
    name                    = google_compute_subnetwork.python-app-restricted-subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

}
