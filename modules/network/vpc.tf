data "aws_availability_zones" "available" {}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    #name  = "main"
    name  = "vpc-rp-${var.short_region_name}-${var.environment}-01"
    environment = "${var.environment}"
  }
}


