output "vpc-id" {
  value = "${aws_vpc.main.id}"
}

output "vpc-cidr-block" {
  value = "${aws_vpc.main.cidr_block}"
}

output "public-a-subnet-id" {
  value = "${aws_subnet.public-a.id}"
}

# output "public-b-subnet-id" {
#   value = "${aws_subnet.public-b.id}"
# }

output "apisub-id" {
  value = "${aws_subnet.private-a.id}"
}

output "datasub-id" {
  value = "${aws_subnet.private-b.id}"
}

output "dbsub-id" {
  value = "${aws_subnet.private-c.id}"
}

output "sg-id" {
  value = "${aws_security_group.sg.id}"
}

