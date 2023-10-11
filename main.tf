#backend for state file
terraform {
   backend "s3" {
      bucket = "tf-states-qa"
      key = "s3-qa-001.state"
      region = "ap-south-1"
   }
}


#Source S3-Bucket for datapipeline

resource "aws_s3_bucket" "input_s3" {
  bucket = "s3-src-rp-mum-qa-01"
  acl    = "private"

  tags = {
    Name        = "s3-src-rp-mum-qa-01"
    Environment = "QA"
  }
}

# Destination S3-Bucket for datapipeline

resource "aws_s3_bucket" "output_s3" {
  bucket = "s3-dest-rp-mum-qa-01"
  acl    = "private"

  tags = {
    Name        = "s3-dest-rp-mum-qa-01"
    Environment = "QA"
  }
}