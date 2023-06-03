provider "google" {
  project = var.GOOGLE_PROJECT
  region  = var.GOOGLE_REGION
}
terraform {
  backend "gcs" {
    bucket = "hitzone-terraform"
    prefix = "terraformtest/state"
  }
}

module "gke_cluster" {
  source         = "../modules/eks"
  GOOGLE_REGION  = var.GOOGLE_REGION
  GOOGLE_PROJECT = var.GOOGLE_PROJECT
  GKE_NUM_NODES  = 2
}