resource "aws_eip" "nat-a" {
  domain = "vpc"
}

# resource "aws_eip" "nat-b" {
#   vpc = true
# }
