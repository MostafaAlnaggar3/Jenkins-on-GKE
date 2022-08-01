output "python-app-vpc-name" {
  value = google_compute_network.python-app-vpc.name
}

output "python-app-managment-subnet-name" {
  value = google_compute_subnetwork.python-app-managment-subnet.name
}

output "python-app-restricted-subnet-name" {
  value = google_compute_subnetwork.python-app-restricted-subnet.name
}