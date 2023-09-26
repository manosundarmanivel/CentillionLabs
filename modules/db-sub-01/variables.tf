variable "vpc_id" {
  type = string
}


variable "dbsubnet_cidr" {
  type = string
  default = "10.0.4.0/26"
}

variable "dbsubnet_name" {
  type = map(any)
  default = {
    "Name" = "dbsub-rp-dev-mum-01"
  }

}