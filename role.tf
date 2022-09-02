resource "aws_iam_role" "replication" {
  name = var.iam_role
  tags = {
    Name = var.iam_role_tags
  }
  assume_role_policy = file("policy.json")
}

resource "aws_iam_policy" "replication" {
  name = var.iam_policy
  tags = {
    Name = var.iam_policy_tags
  }
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetReplicationConfiguration",
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": ["${aws_s3_bucket.source.arn}"]
    },
    {
      "Action": [
        "s3:GetObjectVersionForReplication",
        "s3:GetObjectVersionAcl",
        "s3:GetObjectVersionTagging"
      ],
      "Effect": "Allow",
      "Resource": ["${aws_s3_bucket.source.arn}/*"]
    },
    {
      "Action": [
        "s3:ReplicateObject",
        "s3:ReplicateDelete",
        "s3:ReplicateTags"
      ],
      "Effect": "Allow",
      "Resource": ["${aws_s3_bucket.destination.arn}/*"]
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "replication" {
  role       = aws_iam_role.replication.name
  policy_arn = aws_iam_policy.replication.arn
}