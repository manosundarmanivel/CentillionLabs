####VPC

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
}

module "pub-sub-01" {
  source = "./modules/pub-sub-01"
  vpc_id = module.vpc.vpc_id
  subnet_cidr = var.subnet_cidr
  subnet_name = var.subnet_name
  
}

module "api-sub-01" {
    source = "./modules/api-sub-01"
    vpc_id = module.vpc.vpc_id
    apisubnet_cidr = var.apisubnet_cidr
    apisubnet_name = var.apisubnet_name
  
}

module "data-sub-01" {
    source = "./modules/data-sub-01"
    vpc_id = module.vpc.vpc_id
    datasubnet_cidr = var.datasubnet_cidr
    datasubnet_name = var.datasubnet_name
  
}

module "db-sub-01" {
    source = "./modules/db-sub-01"
    vpc_id = module.vpc.vpc_id
    dbsubnet_cidr = var.dbsubnet_cidr
    dbsubnet_name = var.dbsubnet_name
  
}


module "igw" {
    source = "./modules/internet-gateway"
    vpc_id = module.vpc.vpc_id
    igw_name = var.igw_name

  
}


module "security-group" {
    source = "./modules/security-group"
    vpc_id = module.vpc.vpc_id
    sg_name = var.sg_name
  
}

module "pub-s3-01" {
    source = "./modules/pub-s3-01"
    bucket  = var.bucket
    s3_acl = var.s3_acl
    s3_name = var.s3_name

}

module "pub_s3_02" {
    source = "./modules/pub-s3-02"
    bucket_raw = var.bucket_raw
    s3_acl_raw = var.s3_acl_raw
    s3_name_raw = var.s3_name_raw
  
}

module "prv_s3_01" {
    source = "./modules/prv-s3-01"
    bucket_config = var.bucket_config
    s3_acl_config = var.s3_acl_config
    s3_name_config = var.s3_name_config
  
}


module "prv_s3_02" {
    source = "./modules/prv-s3-02"
    bucket_data = var.bucket_data
    s3_acl_data = var.s3_acl_data
    s3_name_data = var.s3_name_data
  
}


module "elastic_beanstalk" {
    source = "./modules/beanstalk"
    elb_name = var.elb_name
    solution_stack_name = var.solution_stack_name
    tier = var.tier
    vpc_id = module.vpc.vpc_id
    pubpub_subnet_id = module.pub_subnet_id
  
}