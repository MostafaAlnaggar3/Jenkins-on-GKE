# these outputs to use them values in other terrafrom files outside the Network module
output "jenkins-vpc-name" {
  value = google_compute_network.jenkins-vpc.name
}

output "jenkins-managment-subnet-name" {
  value = google_compute_subnetwork.jenkins-managment-subnet.name
}

output "jenkins-restricted-subnet-name" {
  value = google_compute_subnetwork.jenkins-restricted-subnet.name
}