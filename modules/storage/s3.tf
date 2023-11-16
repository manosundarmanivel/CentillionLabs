resource "aws_s3_bucket" "pub-s3-01" {
  bucket = "pubs3-rp-web-${var.short_region_name}-${var.environment}-01"
  # acl    = "public-read-write"

  tags = {
    environment = "${var.environment}"
  }
}

resource "aws_s3_bucket" "pub-s3-02" {
  bucket = "pubs3-rp-rawdata-${var.short_region_name}-${var.environment}-01"
  # acl    = "public-read-write"
 
  tags = {
    environment = "${var.environment}"
  }
}

resource "aws_s3_bucket" "prv-s3-01" {
  bucket = "prvs3-rp-config-${var.short_region_name}-${var.environment}-01"
  # acl    = "private"

  tags = {
    environment = "${var.environment}"
  }
}

resource "aws_s3_bucket" "prv-s3-02" {
  bucket = "prvs3-rp-data-${var.short_region_name}-${var.environment}-01"
  # acl    = "private"

  tags = {
    environment = "${var.environment}"
  }
}
