terraform {
   backend "s3" {
      bucket = "rapport-terraform-tf-state"
      key = "pub-s3-01.state"
      region = "ap-south-1"
   }
}


resource "aws_s3_bucket" "pub-s3-01" {
  bucket = var.bucket
  acl    = var.s3_acl

  tags = var.s3_name
}