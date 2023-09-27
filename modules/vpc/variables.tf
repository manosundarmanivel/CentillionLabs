
variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  type = map(any)
  default = {
    "Name" = "vpc-rp-dev-mum-01"
  }
}