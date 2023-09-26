variable "bucket_data" {
  type = string
  default = "prvs3-rp-data-mum-dev-01"
}

variable "s3_acl_data" {
    type = string
    default = "private"
  
}

variable "s3_name_data" {
    type = map(any)
    default = {
      "Name" = "prvs3-rp-data-mum-dev-01"
    }
  
}