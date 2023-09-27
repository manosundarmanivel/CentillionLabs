terraform {
   backend "s3" {
      bucket = "rapport-terraform-tf-state"
      key = "igw-01.state"
      region = "ap-south-1"
   }
}



resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

 tags = var.igw_name
   
 }