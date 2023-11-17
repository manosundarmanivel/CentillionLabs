resource "aws_s3_bucket_acl" "pub-s3-01-acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.pub-s3-01-acl-ownership,
    aws_s3_bucket_public_access_block.pub-s3-01-access-block
  ]
  bucket = aws_s3_bucket.pub-s3-01.id
  acl    = "public-read"
}

resource "aws_s3_bucket_acl" "pub-s3-02-acl" {
  depends_on = [aws_s3_bucket_ownership_controls.pub-s3-02-acl-ownership]
  bucket     = aws_s3_bucket.pub-s3-02.id
  acl        = "private"
}

resource "aws_s3_bucket_acl" "prv-s3-01-acl" {
  depends_on = [aws_s3_bucket_ownership_controls.prv-s3-01-acl-ownership]
  bucket     = aws_s3_bucket.prv-s3-01.id
  acl        = "private"
}

resource "aws_s3_bucket_acl" "prv-s3-02-acl" {
  depends_on = [aws_s3_bucket_ownership_controls.prv-s3-02-acl-ownership]
  bucket     = aws_s3_bucket.prv-s3-02.id
  acl        = "private"
}
