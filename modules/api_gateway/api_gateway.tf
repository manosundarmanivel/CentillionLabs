resource "aws_vpc_endpoint" "api_gateway_vpc_endpoint" {
  count = 3

  private_dns_enabled = false
  security_group_ids  = ["${var.sg_id}"]
  service_name        = "com.amazonaws.${var.region}.execute-api"
  vpc_endpoint_type   = "Interface"
  vpc_id              = "${var.vpc_id}"
  subnet_ids = ["${var.pub_subnet_id}"]
  tags = {
    Name = "api-gateway-vpc-endpoint"
  }
}

resource "aws_api_gateway_rest_api" "rest_api" {
  body = jsonencode({
    openapi = "3.0.1"
    info = {
      title   = "example"
      version = "1.0"
    }
    paths = {
      "/path1" = {
        get = {
          x-amazon-apigateway-integration = {
            httpMethod           = "GET"
            payloadFormatVersion = "1.0"
            type                 = "HTTP_PROXY"
            uri                  = "https://ip-ranges.amazonaws.com/ip-ranges.json"
          }
        }
      }
    }
  })

  name              = "heimdall-api-gateway-${var.environment}"
  put_rest_api_mode = "merge"

  endpoint_configuration {
    types            = ["PRIVATE"]
    vpc_endpoint_ids = [aws_vpc_endpoint.api_gateway_vpc_endpoint[0].id, aws_vpc_endpoint.api_gateway_vpc_endpoint[1].id, aws_vpc_endpoint.api_gateway_vpc_endpoint[2].id]
  }
}