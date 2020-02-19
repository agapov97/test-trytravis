terraform {
  # Версия terraform
  required_version = "~>0.12.8"
}

provider "google" {
  # Версия провайдера
  version = "2.15"

  # ID проекта
  project = var.project

  region = var.region
}

module "app" {
  source          = "../modules/app"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
  instance_region = var.instance_region
  app_disk_image  = var.app_disk_image
  db_internal_ip  = module.db.db_internal_ip
}

module "db" {
  source          = "../modules/db"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
  instance_region = var.instance_region
  db_disk_image   = var.db_disk_image
}

module "vpc" {
  source        = "../modules/vpc"
  source_ranges = ["${var.local_ip}/32"]
}