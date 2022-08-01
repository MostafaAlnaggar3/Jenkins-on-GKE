module "Network" {
  source                       = "./Network"
  region                       = var.region
  jenkins-managment-subnet-ip  = var.jenkins-managment-subnet-ip
  jenkins-restricted-subnet-ip = var.jenkins-restricted-subnet-ip
}
