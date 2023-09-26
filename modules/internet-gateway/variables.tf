variable "vpc_id" {
  type = string
}


variable "igw_name" {
  type = map(any)
  default = {
    "Name" = "igw-rp-dev-mum-01"
  }
}