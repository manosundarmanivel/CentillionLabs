import json
import boto3
import uuid
import os


def lambda_handler(event, context):
    # Log the S3 event details
    print("Received S3 event:")

    bucket_name = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']

    print(f"trigerred from bucket: {bucket_name} and file: {key}")

    input_data = {
        'job1_source_path': os.environ.get('source_path_1'),
        'job1_target_path': os.environ.get('target_path_1'),
        'customer_raw_data': os.environ.get('customer_raw_data'),
        'customer_cleansed_data': os.environ.get('customer_cleansed_data'),
        'field_mapping_json': os.environ.get('field_mapping_json'),
        'cleansing_mapping_json': os.environ.get('cleansing_mapping_json'),
        'custom_value_mapping_json': os.environ.get('custom_value_mapping_json'),
        'bucket_name': os.environ.get('bucket_name')
    }

    # print(json.dumps(input_data))
    # Perform any additional processing here

    # add ARN of step function
    step_function_arn = os.environ.get('step_fn_arn')

    # Create a Step Functions client
    stepfunctions = boto3.client('stepfunctions')

    try:
        # Start the Step Function execution
        response = stepfunctions.start_execution(
            stateMachineArn=step_function_arn,
            name='DataStdznFlow' + f"_{uuid.uuid1()}",  # You can provide a unique name for each execution
            input=json.dumps(input_data)  # Optional input data in JSON format
        )

        # Log the execution ARN
        print(f"Execution ARN: {response['executionArn']}")

        return {
            'statusCode': 200,
            'body': 'Step Function execution started successfully'
        }
    except Exception as e:
        print(f"Error starting Step Function execution: {str(e)}")
        return {
            'statusCode': 500,
            'body': 'Error starting Step Function execution'
        }