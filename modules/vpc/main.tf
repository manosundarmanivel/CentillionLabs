terraform {
   backend "s3" {
      bucket = "rapport-terraform-tf-state"
      key = "vpc.state"
      region = "ap-south-1"
   }
}


resource "aws_vpc" "vpc01" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = var.vpc_name
}
