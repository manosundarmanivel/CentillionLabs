terraform {
   backend "s3" {
      bucket = "rapport-terraform-tf-state"
      key = "prv-s3-01.state"
      region = "ap-south-1"
   }
}


resource "aws_s3_bucket" "prv-s3-01" {
  bucket = var.bucket_config
  acl    = var.s3_acl_config

  tags = var.s3_name_config
}