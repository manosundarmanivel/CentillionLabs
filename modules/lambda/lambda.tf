
resource "aws_iam_role" "lambda_role" {
  name = "lambda-rp-s3-${var.environment}"

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
  name   = "s3-read-policy-${var.environment}"
  policy = file("../../modules/lambda/s3_read_policy.json") 
}

#  resource "aws_iam_policy" "step_fun_start_exec" {
#    name   = "step-fun-start-exec-policy-${var.environment}"
#    policy = file("step_function_start_exec_policy.json")
#  }



resource "aws_iam_role_policy_attachment" "lambda-s3-role" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.s3_read.arn
}


#  resource "aws_iam_role_policy_attachment" "lambda-step-role" {
#    role       = aws_iam_role.lambda_role.name
#    policy_arn = aws_iam_policy.step_fun_start_exec.arn
#  }


data "archive_file" "zip_the_python_code" {
 type        = "zip"
 source_dir  = "${path.module}/python/"
 output_path = "${path.module}/python/fnDataStdTrigger.zip"
}

module "network" {
    source = "../network"
   
    environment       = "${var.environment}"
    short_region_name = "${var.short_region_name}"
}
 
module "storage" {
  source = "../storage"
 
  environment       = "${var.environment}"
  short_region_name = "${var.short_region_name}"

}

# Create a lambda function
# In terraform ${path.module} is the current directory.
resource "aws_lambda_function" "terraform_lambda_func" {
 filename                       = "${path.module}/python/fnDataStdTrigger.zip"
 function_name                  = "Lambda-DataStdTrigger-rp-${var.short_region_name}-${var.environment}-01"
 role                           = aws_iam_role.lambda_role.arn
 handler                        = "fnDataStdTrigger.lambda_handler"
 runtime                        = "python3.8"
 depends_on                     = [aws_iam_role_policy_attachment.lambda-s3-role]#aws_iam_role_policy_attachment.lambda-step-role]

environment {
    variables = {
        bucket_name = "module.storage.rawdata_s3_02_name"
        cleansing_mapping_json = "configs/cleanser.json"
        custom_value_mapping_json = "s3://module.storage.rawdata_s3_02_name/configs/customer_mapping"
        customer_cleansed_data  = "s3://module.storage.data_s3_02_name/data/processed/cleansed_customer_data/"
        customer_raw_data  = "s3://module.storage.rawdata_s3_02_name/raw-data/customer_POC1.csv"
        field_mapping_json  = "configs/customer_field_mapping.json"
        source_path_1  = "s3://module.storage.rawdata_s3_02_name/raw-data/"
        #step_fn_arn  = data.aws_sfn_state_machine.step_fun.arn
        #target_path_1 = "s3://pubs3-rp-rawdata-mum-dev-01/standard_output/"
    }
  }
  vpc_config {
  subnet_ids = ["module.network.datasub-id.id"]
  security_group_ids = ["module.network.sg-id.id"]
 }
}


 
# data "aws_sfn_state_machine" "step_fun" {
#   name = "step_fun_rp_mum-qa-01"
# }

resource "aws_s3_bucket_notification" "s3-trigger-lambda" {
  bucket =  "module.storage.rawdata_s3_02_id.id"
  lambda_function {
    lambda_function_arn = aws_lambda_function.terraform_lambda_func.arn
    events              = ["s3:ObjectCreated:*"]
    filter_suffix = ".csv"
  }
}


resource "aws_lambda_permission" "allow_bucket_execution" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.terraform_lambda_func.arn
  principal     = "s3.amazonaws.com"
  source_arn    = "${module.storage.rawdata_s3_02_arn}"
}


# resource "aws_s3_bucket_notification" "bucket_notification" {
#   bucket = data.aws_s3_bucket.input_bucket.arn

#   lambda_function {
#     lambda_function_arn = aws_lambda_function.lambda_function.arn
#     events              = ["s3:ObjectCreated:*"]
#     filter_suffix = ".csv"
#   }

#   depends_on = [aws_lambda_permission.allow_bucket_execution]
# }