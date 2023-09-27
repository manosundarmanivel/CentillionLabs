variable "bucket" {
  type = string
  default = "pubs3-rp-web-mum-dev-01"
}

variable "s3_acl" {
    type = string
    default = "public-read-write"
  
}

variable "s3_name" {
    type = map(any)
    default = {
      "Name" = "pubs3-rp-web-mum-dev-01"
    }
  
}