variable "vpc_id" {
  type = string
}


variable "datasubnet_cidr" {
  type = string
  default = "10.0.2.0/23"
}

variable "datasubnet_name" {
  type = map(any)
  default = {
    "Name" = "datasub-rp-dev-mum-01"
  }

}