 terraform {
   backend "s3" {
      bucket = "tf-states-qa"
      key = "sftp-qa-001.state"
      region = "ap-south-1"
   }
} 


#ROLE
resource "aws_iam_role" "sftp_role" {
  name = "transfer-s3-role-qa"

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

#Set SFTP user permissions.
resource "aws_iam_policy" "sftp_s3" {
  name   = "sftp_s3_policy_qa"
  policy = file("sftp_s3_policy.json")
}

resource "aws_iam_role_policy_attachment" "sftp-s3-role" {
  role       = aws_iam_role.sftp_role.name
  policy_arn = aws_iam_policy.sftp_s3.arn
}

#SFTP Server
resource "aws_transfer_server" "sftp_server" {
  identity_provider_type = "SERVICE_MANAGED"
  logging_role           = aws_iam_role.sftp_role.arn

  tags = {
    Name        = "sftp-rp-mum-qa-01"
  }
}

#Import s3

data "aws_s3_bucket" "input-bucket" {
  bucket = "s3-src-rp-mum-qa-01"
}

#create sftp user 
 resource "aws_transfer_user" "ftp_user" {
  #depends_on     = [aws_s3_bucket.b]
  server_id      = aws_transfer_server.sftp_server.id
  user_name      = "rapport-qa"
  role           = aws_iam_role.sftp_role.arn
  #home_directory = "/${s3-src-rp-mum-qa-01}/raw-data"
  home_directory = "/${data.aws_s3_bucket.input-bucket.arn}/raw-data"
} 

#SSH key for user to manage sftp account
#Generate SSH key using PuttyGen
/* resource "aws_transfer_ssh_key" "ssh_key" {
  server_id = aws_transfer_server.sftp_server.id
  user_name = aws_transfer_user.ftp_user.user_name
  body      = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEApjf+e/na2t1iIX2mSSyR3ll5VrlpxHS8THx9PIOPnoNXC5y4ERS7tJ/n50RiS6y9QiGKl0dDQvCaIVL0Ydj3NSYENKKYZ694vwro0uCH8FgmUEaofqWT9gogCsdj1SRLVhHzLub7Yqt4iFcXlM3RvMTUl0bwjowe5yyiWWKJL3ycwC+USEDgL1vsyS7zm4RcyC/FIn6oKoc/Y5rfoR+WWBLnSU8L1605sE4X/Z2GGb4JQj4VlopmBXLW9CyST5eXb0U5FU6+nL30fZVpgFim0IpBj4hCYyTClxwztl1WW9jmiCRM2JPdbv5TazJC1wxPx6NJDqrVmmcxClpLy3q+oQ== rsa-key-20200405"
} */