 terraform {
   backend "s3" {
      bucket = "tf-states-qa"
      key = "step-fun-qa-001.state"
      region = "ap-south-1"
   }
} 

/* resource "aws_iam_role" "step_function_role" {
  name               = "step-fun-role-qa"
  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "states.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": "StepFunctionAssumeRole"
      }
    ]
  }
  EOF
} */

/* resource "aws_iam_policy" "policy_invoke_lambda" {
  name        = "stepFunctionSampleLambdaFunctionInvocationPolicy"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "lambda:InvokeFunction",
                "lambda:InvokeAsync"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

// Attach policy to IAM Role for Step Function
resource "aws_iam_role_policy_attachment" "step_fun_invoke_lambda" {
  role       = aws_iam_role.step_function_role.name
  policy_arn = aws_iam_policy.policy_invoke_lambda.arn
} */

#Import existing step function role
data "aws_iam_role" "step_fun_role_qa" {
name = "StepFunctions-step_fun_rp_mum-dev-01-role-jy6xk4xm5"
}


// Create state machine for step function
resource "aws_sfn_state_machine" "sfn_state_machine" {
  name     = "step_fun_rp_mum-qa-01"
  role_arn = data.aws_iam_role.step_fun_role_qa.arn

  definition = <<EOF

{
  "StartAt": "Glue_Start_Job1_Run",
  "States": {
    "Glue_Start_Job1_Run": {
      "Type": "Task",
      "Resource": "arn:aws:states:::glue:startJobRun.sync",
      "Parameters": {
        "JobName": "glue-rp-mum-qa-01",
        "Arguments": {
          "--JOB1_SOURCE_PATH.$": "$.job1_source_path",
          "--CUSTOMER_RAW_DATA.$": "$.customer_raw_data",
          "--CUSTOMER_CLEANSED_DATA.$": "$.customer_cleansed_data",
          "--FIELD_MAPPING_JSON.$": "$.field_mapping_json",
          "--CLEANSING_MAPPING_JSON.$": "$.cleansing_mapping_json",
          "--CUSTOM_VALUE_MAPPING_JSON.$": "$.custom_value_mapping_json",
          "--BUCKET_NAME.$": "$.bucket_name"
        }
      },
      "ResultPath": null,
      "End": true
    }
  },
  "Comment": "Triggers glue job for data standardization when customer file is uploaded to source s3 bucket"
}
EOF

  #depends_on = ["aws_lambda_function.Glue_Start_Job1_Run","aws_lambda_function.Glue_Start_Job1_Run"]

}