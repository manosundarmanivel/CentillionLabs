terraform {
   backend "s3" {
      bucket = "rapport-terraform-tf-state"
      key = "prv-s3-02.state"
      region = "ap-south-1"
   }
}


resource "aws_s3_bucket" "prv-s3-02" {
  bucket = var.bucket_data
  acl    = var.s3_acl_data

  tags = var.s3_name_data
}