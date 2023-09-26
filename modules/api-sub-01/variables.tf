variable "vpc_id" {
  type = string
}


variable "apisubnet_cidr" {
  type = string
  default = "10.0.5.0/24"
}

variable "apisubnet_name" {
  type = map(any)
  default = {
    "Name" = "apisub-rp-dev-mum-01"
  }

}