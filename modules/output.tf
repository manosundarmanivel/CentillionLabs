output "vpc_id" {
  value = "${module.network.vpc_id}"
}


output "vpc-cidr-block" {
  value = "${module.network.vpc-cidr-block}"
}


output "public-a-subnet-id" {
  value = "${module.network.public-a-subnet-id}"
}

# output "public-b-subnet-id" {
#   value = "${aws_subnet.public-b.id}"
# }

output "private-a-subnet-id" {
  value = "${module.network.private-a-subnet-id}"
}

output "private-b-subnet-id" {
  value = "${module.network.private-b-subnet-id}"
}

output "private-c-subnet-id" {
  value = "${module.network.private-c-subnet-id}"
}
