provider "aws" {
  region = "${var.region}"
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

  environment       = "${var.environment}"
  short_region_name = "${var.short_region_name}"
}

module "storage" {
  source = "../../modules/storage"

  environment = "${var.environment}"
  short_region_name = "${var.short_region_name}"
}

module "lambda" {
  source = "../../modules/data-pipeline/lambda"
}


# module "beanstalk" {
#   source = "../../modules/beanstalk"

#   environment = "${var.environment}"
#   short_region_name = "${var.short_region_name}"
# }
