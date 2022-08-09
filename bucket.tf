resource "aws_s3_bucket" "source" {
  provider      = aws.primary_region
  bucket        = var.source_bucket
  force_destroy = true
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_s3_bucket" "destination" {
  provider      = aws.secondary_region
  bucket        = var.destination_bucket
  force_destroy = true
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_s3control_multi_region_access_point" "backup" {
  details {
    name = "backup"

    region {
      bucket = aws_s3_bucket.source.id
    }

    region {
      bucket = aws_s3_bucket.destination.id
    }
  }
}
