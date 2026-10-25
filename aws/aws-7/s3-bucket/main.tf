resource "aws_s3_bucket" "bk256789" {
  bucket = "bk256789"
}

resource "aws_s3_bucket_ownership_controls" "bk256789_ownership" {
  bucket = aws_s3_bucket.bk256789.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "bk256789_public_access" {
  bucket                  = aws_s3_bucket.bk256789.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "bk256789_versioning" {
  bucket = aws_s3_bucket.bk256789.id

  versioning_configuration {
    status = "Disabled"
  }
}