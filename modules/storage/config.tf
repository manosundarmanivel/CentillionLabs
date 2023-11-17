resource "aws_s3_bucket_public_access_block" "pub-s3-01-access-block" {
  bucket = aws_s3_bucket.pub-s3-01.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "pub-s3-01-acl-ownership" {
  bucket = aws_s3_bucket.pub-s3-01.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_ownership_controls" "pub-s3-02-acl-ownership" {
  bucket = aws_s3_bucket.pub-s3-02.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_ownership_controls" "prv-s3-01-acl-ownership" {
  bucket = aws_s3_bucket.prv-s3-01.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_ownership_controls" "prv-s3-02-acl-ownership" {
  bucket = aws_s3_bucket.prv-s3-02.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
