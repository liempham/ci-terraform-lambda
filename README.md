# Description

This is a skeleton to enable deployment of Lambda function via Terraform. It could be used in a CI environment such as Jenkins.
The sample Lambda function in this repo is setup to be called every 30 minutes from a CloudWatch event trigger. 
A few Lambda configurations are available in variables.tf.

## Usage

1. Update AWS region, your access & secret key
2. Update file paths in "deploy_lambda.sh"
3. Ensure the current IAM user has enough permissions to manage Lambda function and IAM role
4. Execute "deploy_lambda.sh"

##TODO
1. Add automation test skeleton
2. Support pipeline configuration as code for some CIs such as Jenkins, GoCD, etc.
