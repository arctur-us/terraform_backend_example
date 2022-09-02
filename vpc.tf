resource "aws_vpc" "vpc" {
  cidr_block = var.vpc-cidr
  tags = {
    Name = var.vpc_tags
  }
}

resource "aws_subnet" "private-subnet" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(var.private_subnet_cidr, var.private_subnet_newbits, count.index + var.private_subnet_increase)
  map_public_ip_on_launch = false
  availability_zone       = element(var.availability_zones, count.index)
  tags = {
    Name = "${upper(var.project_name)}-PRIVATE-SUBNET-${count.index + 1}"
  }
}

resource "aws_security_group" "sg-web" {
  vpc_id      = aws_vpc.vpc.id
  name        = "webserver"
  description = "Security Group for Web Servers"
  tags = {
    Name = "${upper(var.project_name)}-SG"
  }
  dynamic "ingress" {
    for_each = var.inbound_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.outbound_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = [var.private_subnet_cidr]
    }
  }
}