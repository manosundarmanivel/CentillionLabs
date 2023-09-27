variable "bucket_raw" {
  type = string
  default = "pubs3-rp-rawdata-mum-dev-01"
}

variable "s3_acl_raw" {
    type = string
    default = "public-read-write"
  
}

variable "s3_name_raw" {
    type = map(any)
    default = {
      "Name" = "pubs3-rp-rawdata-mum-dev-01"
    }
  
}