variable "source_bucket" {
  default = "yk-terraform-backend-source"
}

variable "destination_bucket" {
  default = "yk-terraform-backend-destination"
}

variable "access_point" {
  default = "backup"
}

variable "replication_rule" {
  default = "yk-replication-rule"
}

variable "iam_role" {
  default = "yk-tf-iam-role-replication-12345"
}

variable "iam_policy" {
  default = "yk-tf-iam-role-policy-replication-12345"
}