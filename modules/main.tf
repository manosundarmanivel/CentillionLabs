module "network" {
  source = "./modules/network"

  environment = "${var.environment}"
}

module "storage" {
  source = "./modules/storage"

  environment = "${var.environment}"
}

module "lambda" {
  source = "./modules/lambda"

  environment = "${var.environment}"
}

# module "beanstalk" {
#   source = "./modules/beanstalk"

#   environment = "${var.environment}"
# }


