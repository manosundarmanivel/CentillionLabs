output "api-gateway-endpoint-1" {
  value = "${aws_vpc_endpoint.api_gateway_vpc_endpoint[0].id}"
}

output "api-gateway-endpoint-2" {
  value = "${aws_vpc_endpoint.api_gateway_vpc_endpoint[1].id}"
}

output "api-gateway-endpoint-3" {
  value = "${aws_vpc_endpoint.api_gateway_vpc_endpoint[2].id}"
}

output "api-gateway-rest-api-id" {
  value = "${aws_api_gateway_rest_api.rest_api.id}"
}