terraform {
   backend "s3" {
      bucket = "rapport-terraform-tf-state"
      key = "pub-s3-02.state"
      region = "ap-south-1"
   }
}


resource "aws_s3_bucket" "pub-s3-02" {
  bucket = var.bucket_raw
  acl    = var.s3_acl_raw

  tags = var.s3_name_raw
}