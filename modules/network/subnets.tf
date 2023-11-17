resource "aws_subnet" "public-a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    name        = "pubsub-rp-${var.short_region_name}-${var.environment}-01"
    environment = "${var.environment}"
  }
}

resource "aws_subnet" "private-a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    name        = "apisub-rp-${var.short_region_name}-${var.environment}-01"
    environment = "${var.environment}"
  }
}

resource "aws_subnet" "private-b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.4.0/23"
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    name        = "datasub-rp-${var.short_region_name}-${var.environment}-01"
    environment = "${var.environment}"
  }
}

resource "aws_subnet" "private-c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.6.0/26"
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    name        = "dbsub-rp-${var.short_region_name}-${var.environment}-01"
    environment = "${var.environment}"
  }
}

resource "aws_subnet" "private-d" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.7.0/26"
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    name        = "dssub-rp-${var.short_region_name}-${var.environment}-01"
    environment = var.environment
  }

}
