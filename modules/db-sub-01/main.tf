terraform {
   backend "s3" {
      bucket = "rapport-terraform-tf-state"
      key = "db-sub-01.state"
      region = "ap-south-1"
   }
}

data "aws_availability_zones" "az" {
  state = "available"
}


resource "aws_subnet" "private03" {
  vpc_id     = var.vpc_id
  cidr_block = var.dbsubnet_cidr
  availability_zone = data.aws_availability_zones.az.names[0]
  map_public_ip_on_launch = true

tags = var.dbsubnet_name

}
