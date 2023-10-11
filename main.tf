terraform {
   backend "s3" {
      bucket = "tf-states-qa"
      key = "lambda-qa-001.state"
      region = "ap-south-1"
   }
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_rp_s3_qa"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}


resource "aws_iam_policy" "s3_read" {
  name   = "s3_read_policy_qa"
  policy = file("s3_read_policy_qa.json")
}

# resource "aws_iam_policy" "step_fun_start_exec" {
#   name   = "step_fun_start_exec_policy_qa"
#   policy = file("step_function_start_exec_policy_qa.json")
# }



resource "aws_iam_role_policy_attachment" "lambda-s3-role" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.s3_read.arn
}


# resource "aws_iam_role_policy_attachment" "lambda-step-role" {
#   role       = aws_iam_role.lambda_role.name
#   policy_arn = aws_iam_policy.step_fun_start_exec.arn
# }


data "archive_file" "zip_the_python_code" {
 type        = "zip"
 source_dir  = "${path.module}/python/"
 output_path = "${path.module}/python/fnDataStdTrigger.zip"
}

# Create a lambda function
# In terraform ${path.module} is the current directory.
resource "aws_lambda_function" "terraform_lambda_func" {
 filename                       = "${path.module}/python/fnDataStdTrigger.zip"
 function_name                  = "Lambda_DataStdTrigger_rp_mum_qa_01"
 role                           = aws_iam_role.lambda_role.arn
 handler                        = "fnDataStdTrigger.lambda_handler"
 runtime                        = "python3.8"
 depends_on                     = [aws_iam_role_policy_attachment.lambda-s3-role]



environment {
    variables = {
        bucket_name = "s3-src-rp-mum-qa-01"
        cleansing_mapping_json = "s3://s3-src-rp-mum-qa-01/configs/cleanser.json"
        custom_value_mapping_json = "s3://s3-src-rp-mum-qa-01/configs/custom_value_mapping.json"
        customer_cleansed_data  = "s3://s3-dest-rp-mum-qa-01/cleansed_customer_data/"
        customer_raw_data  = "s3://s3-src-rp-mum-qa-01/raw-data/"
        field_mapping_json  = "s3://s3-src-rp-mum-qa-01/configs/customer_field_mapping.json"
        source_path_1  = "s3://s3-src-rp-mum-qa-01/raw-data/"
        #step_fn_arn  = "arn:aws:states:ap-south-1:973713214519:stateMachine:step_fun_rp_mum-dev-01"
        #target_path_1 = "s3://pubs3-rp-rawdata-mum-dev-01/standard_output/"
    }
  }


}

# data "aws_s3_bucket" "input-bucket" {
#   bucket = "s3-src-rp-mum-qa-01"
# }

# resource "aws_s3_bucket_notification" "s3-trigger-lambda" {
#   bucket =  data.aws_s3_bucket.input-bucket.id

#   lambda_function {
#     lambda_function_arn = aws_lambda_function.terraform_lambda_func.arn
#     events              = ["s3:ObjectCreated:*"]
#     filter_suffix = ".csv"
#   }
# }

# vpc_config {
# 	    subnet_ids         = var.subnets
# 	    security_group_ids = var.sg_ids
# 	  }

output "teraform_aws_role_output" {
 value = aws_iam_role.lambda_role.name
}

output "teraform_aws_role_arn_output" {
 value = aws_iam_role.lambda_role.arn
}
