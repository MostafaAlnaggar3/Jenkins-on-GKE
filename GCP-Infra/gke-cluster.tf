# GKE cluster
resource "google_container_cluster" "python-app-gke-cluster" {
  name                     = "python-app-gke-cluster"
  location                 = "${var.region}-b"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = module.Network.python-app-vpc-name
  subnetwork               = module.Network.python-app-restricted-subnet-name

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = var.python-app-managment-subnet-ip
    }
  }
    
  ip_allocation_policy {

  }

  # to make the cluster private 
  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = var.gke-master-ip
  }
}

# cluster node configurations
resource "google_container_node_pool" "gke-cluster-nodes" {
  name       = "gke-cluster-nodes"
  location   = "${var.region}-b"
  cluster    = google_container_cluster.python-app-gke-cluster.name
  node_count = 2

  node_config {
    machine_type    = "e2-medium"
    service_account = google_service_account.gke-sa.email
  }
}
