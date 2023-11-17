output "vpc-id" {
  value = aws_vpc.main.id
}

output "vpc" {
  value = aws_vpc.main
}

output "vpc-cidr-block" {
  value = aws_vpc.main.cidr_block
}

output "public-a-subnet-id" {
  value = aws_subnet.public-a.id
}

output "apisub-id" {
  value = aws_subnet.private-a.id
}

output "datasub-id" {
  value = aws_subnet.private-b.id
}

output "dbsub-id" {
  value = aws_subnet.private-c.id
}

output "dssub-id" {
  value = aws_subnet.private-d.id
}

output "sg-id" {
  value = aws_security_group.sg.id
}

output "eip-address" {
  value = aws_eip.nat-a.address
}

output "pub_vpc_endpoint_rawdata" {
  value = aws_vpc_endpoint.rawdata-endpoint
}

output "pri_vpc_endpoint_config" {
  value = aws_vpc_endpoint.config-endpoint
}

output "pri_vpc_endpoint_data" {
  value = aws_vpc_endpoint.data-endpoint

}

