resource "aws_subnet" "public-a" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"
  map_public_ip_on_launch = true

  tags = {
    name        = "pubsub-rp-eus-dev-01"
    environment = "${var.environment}"
  }
}

# resource "aws_subnet" "public-b" {
#   vpc_id                  = "${aws_vpc.main.id}"
#   cidr_block              = "10.0.3.0/24"
#   availability_zone       = "${data.aws_availability_zones.available.names[1]}"
#   map_public_ip_on_launch = true

#   tags = {
#     name        = "public-b"
#     environment = "${var.environment}"
#   }
# }

resource "aws_subnet" "private-a" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "10.0.5.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"

  tags = {
    name        = "apisub-rp-eus-dev-01"
    environment = "${var.environment}"
  }
}

resource "aws_subnet" "private-b" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "10.0.2.0/23"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"

  tags = {
    name        = "datasub-rp-eus-dev-01"
    environment = "${var.environment}"
  }
}

resource "aws_subnet" "private-c" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "10.0.4.0/26"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"

  tags = {
    name        = "dbsub-rp-eus-dev-01"
    environment = "${var.environment}"
  }
}
