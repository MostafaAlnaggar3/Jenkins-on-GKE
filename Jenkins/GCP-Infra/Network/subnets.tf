#=========================> Subnets

resource "google_compute_subnetwork" "python-app-managment-subnet" {

  name          = "python-app-managment-subnet"
  region        = var.region
  network       = google_compute_network.python-app-vpc.name
  ip_cidr_range = var.python-app-managment-subnet-ip

}

resource "google_compute_subnetwork" "python-app-restricted-subnet" {

  name                     = "python-app-restricted-subnet"
  region                   = var.region
  network                  = google_compute_network.python-app-vpc.name
  ip_cidr_range            = var.python-app-restricted-subnet-ip
  
}
