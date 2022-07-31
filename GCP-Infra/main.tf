module "Network" {
  source                          = "./Network"
  region                          = var.region
  python-app-managment-subnet-ip  = var.python-app-managment-subnet-ip
  python-app-restricted-subnet-ip = var.python-app-restricted-subnet-ip
}
