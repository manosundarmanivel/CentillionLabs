resource "aws_route_table" "public-a" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    name        = "pubrt-rp-${var.short_region_name}-${var.environment}-01"
    environment = "${var.environment}"
  }
}

resource "aws_route_table_association" "public-a" {
  subnet_id      = aws_subnet.public-a.id
  route_table_id = aws_route_table.public-a.id
}


resource "aws_route_table" "private-a" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-a.id
  }

  tags = {
    name        = "prirt-rp-${var.short_region_name}-${var.environment}-01"
    environment = "${var.environment}"
  }
}

resource "aws_route_table_association" "private-a" {
  subnet_id      = aws_subnet.private-a.id
  route_table_id = aws_route_table.private-a.id
}

resource "aws_route_table_association" "private-b" {
  subnet_id      = aws_subnet.private-b.id
  route_table_id = aws_route_table.private-a.id
}

resource "aws_route_table_association" "private-c" {
  subnet_id      = aws_subnet.private-c.id
  route_table_id = aws_route_table.private-a.id
}

resource "aws_route_table_association" "private-d" {
  subnet_id      = aws_subnet.private-d.id
  route_table_id = aws_route_table.private-a.id
}

resource "aws_route_table" "rawdata-route-table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    name        = "endpoint-pubrt-rp-${var.short_region_name}-${var.environment}-01"
    environment = "${var.environment}"
  }
}
resource "aws_vpc_endpoint_route_table_association" "rawdata_rt_association" {
  route_table_id  = aws_route_table.rawdata-route-table.id
  vpc_endpoint_id = aws_vpc_endpoint.rawdata-endpoint.id
}

resource "aws_route_table" "config-route-table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-a.id
  }
  tags = {
    name        = "endpoint-prirt-rp-${var.short_region_name}-${var.environment}-01"
    environment = "${var.environment}"
  }
}

resource "aws_vpc_endpoint_route_table_association" "config_rt_association" {
  route_table_id  = aws_route_table.config-route-table.id
  vpc_endpoint_id = aws_vpc_endpoint.config-endpoint.id
}

resource "aws_route_table" "data-route-table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-a.id
  }
  tags = {
    name        = "endpoint-prirt-rp-${var.short_region_name}-${var.environment}-02"
    environment = "${var.environment}"
  }
}

resource "aws_vpc_endpoint_route_table_association" "data_rt_association" {
  route_table_id  = aws_route_table.data-route-table.id
  vpc_endpoint_id = aws_vpc_endpoint.data-endpoint.id
}
