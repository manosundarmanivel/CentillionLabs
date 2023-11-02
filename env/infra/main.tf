provider "aws" {
  region = "${var.region}"
}

# module "dev-state" {
#   source = "../../modules/state"

#   environment = "${var.environment}"
# }

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

# output "web-alb-dns-name" {
#   value = "${module.staging-infrastructure.web-alb-dns-name}"
# }

# output "web-instance-ips" {
#   value = "${module.staging-infrastructure.web-instance-ips}"
# }
