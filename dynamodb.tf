resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = var.dynamodb_table
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 5
  hash_key       = "StateId"
  range_key      = "StateName"

  attribute {
    name = "StateId"
    type = "S"
  }

  attribute {
    name = "StateName"
    type = "S"
  }

  # ttl {
  #   attribute_name = var.timeto_live
  #   enabled        = false
  # }

  tags = {
    Name        = var.dynamodb_tags
    Environment = "production"
  }
}