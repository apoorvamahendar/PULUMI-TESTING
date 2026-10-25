resource "aws_s3_bucket" "storage_bucket" {
  bucket = "cloudagentra-storage-bucket-0392913"

  tags = {
    Name  = "cloudagentra-storage-bucket-0392913"
    Stack = "s3-bucket"
  }
}

resource "aws_s3_bucket_versioning" "storage_bucket_versioning" {
  bucket = aws_s3_bucket.storage_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "storage_bucket_public_access_block" {
  bucket                  = aws_s3_bucket.storage_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

output "bucket_id" {
  value = aws_s3_bucket.storage_bucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.storage_bucket.arn
}

output "bucket_versioning_status" {
  value = aws_s3_bucket_versioning.storage_bucket_versioning.versioning_configuration[0].status
}