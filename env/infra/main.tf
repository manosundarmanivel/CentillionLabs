provider "aws" {
  region = var.region
  access_key = "${access_key}"
  secret_key = "${secret_key}"
}

# terraform {
#   backend "s3" {
#     bucket = "tf-states-qa"
#     key    = "dev.tfstate"
#     region = "ap-south-1"
#   }
# }

module "network" {
  source = "../../modules/network"

  environment       = var.environment
  short_region_name = var.short_region_name
}

# module "storage" {
#   source = "../../modules/storage"

#   environment       = var.environment
#   short_region_name = var.short_region_name
# }

# module "lambda" {
#   source = "../../modules/lambda"

#   environment       = var.environment
#   short_region_name = var.short_region_name
# }

# module "glue" {
#   source = "../../modules/glue"

#   environment       = var.environment
#   short_region_name = var.short_region_name
#   job_file          = var.job_file
# }

# module "bastion_host" {
#   source            = "../../modules/bastion_host"
#   environment       = var.environment
#   short_region_name = var.short_region_name
#   aws_region        = var.region
#   instance_type     = var.instance_type
#   vpc_sg = module.network.vpc-id
#   sub_pub = module.network.public-a-subnet-id
# }

# module "kms" {
#   source = "../../modules/kms"
#   region = var.environment
# }

# module "sftp" {
#   source = "../../modules/sftp"
#   # depends_on = [module.storage.web_s3_01, module.network.vpc]
#   environment       = var.environment
#   short_region_name = var.short_region_name
#   vpc_id = module.network.vpc-id
#   sg_id = module.network.sg-id
#   s3_bucket = module.storage.web_s3_01.bucket
# }

# module "beanstalk" {
#   source = "../../modules/beanstalk"

#   environment = "${var.environment}"
#   short_region_name = "${var.short_region_name}"
# }
