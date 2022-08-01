# Management subnet: will have the management instance "jenkins-slave" 

resource "google_compute_subnetwork" "jenkins-managment-subnet" {

  name          = "jenkins-managment-subnet"
  region        = var.region
  network       = google_compute_network.jenkins-vpc.name
  ip_cidr_range = var.jenkins-managment-subnet-ip

}

# Restricted subnet: will have GKE cluster
resource "google_compute_subnetwork" "jenkins-restricted-subnet" {

  name                     = "jenkins-restricted-subnet"
  region                   = var.region
  network                  = google_compute_network.jenkins-vpc.name
  ip_cidr_range            = var.jenkins-restricted-subnet-ip
  
}
