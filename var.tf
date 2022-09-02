variable "source_bucket" {
  type    = string
  default = "yk-terraform-backend-source"
}

variable "destination_bucket" {
  type    = string
  default = "yk-terraform-backend-destination"
}

variable "access_point" {
  type    = string
  default = "backup"
}

variable "replication_rule" {
  type    = string
  default = "yk-replication-rule"
}

variable "iam_role" {
  type    = string
  default = "yk-tf-iam-role-replication-12345"
}

variable "iam_policy" {
  type    = string
  default = "yk-tf-iam-role-policy-replication-12345"
}

variable "dynamodb_table" {
  type    = string
  default = "yk-tf-states"
}

variable "timeto_live" {
  type    = string
  default = "yk-time-to-exist"
}

variable "dynamodb_tags" {
  type    = string
  default = "yk-dynamodb-table"
}

variable "iam_role_tags" {
  type    = string
  default = "yk-iam-role"
}

variable "iam_policy_tags" {
  type    = string
  default = "yk-iam-policy"
}

variable "s3_source_tags" {
  type    = string
  default = "yk-s3-source"
}

variable "s3_destination_tags" {
  type    = string
  default = "yk-s3-destination"
}

variable "vpc-cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc-subnets" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_tags" {
  type    = string
  default = "yk-vpc"
}

variable "subnet_tags" {
  type    = string
  default = "yk-subnet"
}

variable "private_subnet_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "private_subnet_newbits" {
  type    = number
  default = 8
}

variable "private_subnet_increase" {
  type    = number
  default = 0
}

variable "project_name" {
  type    = string
  default = "yk"
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "inbound_ports" {
  type    = list(number)
  default = [80, 443]
}

variable "outbound_ports" {
  type    = list(number)
  default = [443, 8080]
}