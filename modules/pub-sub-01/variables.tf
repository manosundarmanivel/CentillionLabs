variable "vpc_id" {
  type = string
}


variable "subnet_cidr" {
  type = string
  default = "10.0.1.0/24"
}

variable "subnet_name" {
  type = map(any)
  default = {
    "Name" = "pubsub-rp-dev-mum-01"
  }

}