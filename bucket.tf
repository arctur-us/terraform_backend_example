resource "aws_s3_bucket" "mybackend" {
  provider = aws.primary_region
  bucket   = var.bucket_name
}

resource "aws_s3_bucket" "backend_copy" {
  provider = aws.secondary_region
  bucket   = var.bucket_copy
}

resource "aws_s3control_multi_region_access_point" "backup" {
  details {
    name = "backup"

    region {
      bucket = aws_s3_bucket.mybackend.id
    }

    region {
      bucket = aws_s3_bucket.backend_copy.id
    }
  }
}
