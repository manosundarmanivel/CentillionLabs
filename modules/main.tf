module "network" {
  source = "./modules/network"

  environment = "${var.environment}"
}

module "storage" {
  source = "./modules/storage"

  environment = "${var.environment}"
}

module "lambda" {
  source = "./modules/data-pipeline/lambda"

  environment = "${var.environment}"
  short_region_name = "${var.short_region_name}"
}

# module "beanstalk" {
#   source = "./modules/beanstalk"

#   environment = "${var.environment}"
# }


