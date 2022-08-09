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

variable "dynamodb_table" {
  default = "yk-tf-states"
}

variable "timeto_live" {
  default = "yk-time-to-exist"
}

variable "dynamodb_tags" {
  default = "yk-dynamodb-table"
}