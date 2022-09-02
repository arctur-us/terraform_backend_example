resource "aws_s3_bucket" "source" {
  provider = aws.primary_region
  bucket   = var.source_bucket
  tags = {
    Name = var.s3_source_tags
  }
}

resource "aws_s3_bucket" "destination" {
  provider = aws.secondary_region
  bucket   = var.destination_bucket
  tags = {
    Name = var.s3_destination_tags
  }
}

resource "aws_s3_bucket_versioning" "destination" {
  provider = aws.secondary_region
  bucket   = aws_s3_bucket.destination.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3control_multi_region_access_point" "backup" {
  details {
    name = var.access_point
    region {
      bucket = aws_s3_bucket.source.id
    }
    region {
      bucket = aws_s3_bucket.destination.id
    }
  }
}

resource "aws_s3_bucket_acl" "source_bucket_acl" {
  provider = aws.primary_region
  bucket   = aws_s3_bucket.source.id
  acl      = "private"
}

resource "aws_s3_bucket_versioning" "source" {
  provider = aws.primary_region
  bucket   = aws_s3_bucket.source.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_replication_configuration" "replication" {
  provider   = aws.primary_region
  depends_on = [aws_s3_bucket_versioning.source]
  role       = aws_iam_role.replication.arn
  bucket     = aws_s3_bucket.source.id

  rule {
    id     = var.replication_rule
    status = "Enabled"
    destination {
      bucket        = aws_s3_bucket.destination.arn
      storage_class = "STANDARD"
    }
  }
}