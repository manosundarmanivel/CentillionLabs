provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "tf-states-qa"
    key    = "dev.tfstate"
    region = "ap-south-1"
  }
}

module "network" {
  source = "../../modules/network"

  environment       = var.environment
  short_region_name = var.short_region_name
}

module "storage" {
  source = "../../modules/storage"

  environment       = var.environment
  short_region_name = var.short_region_name
}

module "lambda" {
  source = "../../modules/lambda"

  environment       = var.environment
  short_region_name = var.short_region_name
}

module "glue" {
  source = "../../modules/glue"

  environment       = var.environment
  short_region_name = var.short_region_name
  job_file          = var.job_file
}



# module "beanstalk" {
#   source = "../../modules/beanstalk"

#   environment = "${var.environment}"
#   short_region_name = "${var.short_region_name}"
# }
