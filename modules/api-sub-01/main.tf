terraform {
   backend "s3" {
      bucket = "rapport-terraform-tf-state"
      key = "api-sub-01.state"
      region = "ap-south-1"
   }
}

data "aws_availability_zones" "az" {
  state = "available"
}


resource "aws_subnet" "private01" {
  vpc_id     = var.vpc_id
  cidr_block = var.apisubnet_cidr
  availability_zone = data.aws_availability_zones.az.names[0]
  map_public_ip_on_launch = true

tags = var.apisubnet_name

}
