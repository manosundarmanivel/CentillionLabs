resource "aws_vpc_endpoint" "sftp_vpc_endpoint" {
  vpc_id            = "${var.vpc_id}"
  service_name      = "com.amazonaws.ap-south-1.transfer.server"
  vpc_endpoint_type = "Interface"

  security_group_ids = ["${var.sg_id}"]
  tags = {
    "Name" = "sftp-vpc-endpoint-${var.environment}"
  }
  #private_dns_enabled = true
}

resource "aws_transfer_server" "sftp_server" {
  identity_provider_type = "SERVICE_MANAGED"
  endpoint_type = "VPC_ENDPOINT"
  endpoint_details {
      vpc_endpoint_id = "${aws_vpc_endpoint.sftp_vpc_endpoint.id}"
} 
tags = {
  Name = "nova-transfer-server-${var.environment}"
}
}


#ROLE
resource "aws_iam_role" "sftp_role" {
  name = "transfer-s3-role-new"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Principal": {
            "Service": "transfer.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

#create sftp user
 resource "aws_transfer_user" "ftp_user" {
#   depends_on     = [data.aws_s3_bucket.input-bucket]
  server_id      = aws_transfer_server.sftp_server.id
  user_name      = "rapport-new"
  role           = "${aws_iam_role.sftp_role.arn}"
  #home_directory = "/${s3-src-rp-mum-qa-01}/raw-data"
  home_directory = "/${var.s3_bucket}/raw-data"
} 