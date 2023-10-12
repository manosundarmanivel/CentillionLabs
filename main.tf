  terraform {
   backend "s3" {
      bucket = "tf-states-qa"
      key = "glue-job-qa-001.state"
      region = "ap-south-1"
   }
}  

resource "aws_iam_role" "glue_role" {
  name = "Glue_role_qa"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "glue.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

#custom policy
resource "aws_iam_policy" "glue_s3" {
  name   = "glue_policy_limit_s3_qa"
  policy = file("glue_policy_limit_s3.json")
}


#Policy attachment
resource "aws_iam_role_policy_attachment" "glue_s3_attch" {
  role       = aws_iam_role.glue_role.name
  policy_arn = aws_iam_policy.glue_s3.arn
}

#import s3 bucket

data "aws_s3_bucket" "input-bucket" {
  bucket = "s3-src-rp-mum-qa-01"
}

#Glue job
resource "aws_glue_job" "my_job_resource" {
    name     = "glue-rp-mum-qa-01"
    role_arn = aws_iam_role.glue_role.arn
    glue_version      = "4.0"
    command {
        name            = "glueetl-qa-01"
        script_location = "s3://s3-src-rp-mum-qa-01/scripts/data_std_main.py"
        python_version  = "3"
    }

    default_arguments = {
    # ... potentially other arguments ...
    #"--continuous-log-logGroup"          = aws_cloudwatch_log_group.example.name
    "--enable-continuous-cloudwatch-log" = "true"
    #"--enable-continuous-log-filter"     = "true"
    "--enable-metrics"                   = "true"
    "--enable-job-insights"              = "true"
    "--extra-py-files"                   = "s3://s3-src-rp-mum-qa-01/libraries/datastdlib-1.0.0-py3-none-any.whl"
  }
}

