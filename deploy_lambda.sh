#!/bin/bash

echo 'Deploying Lambda function using Terraform'

LAMBDA_FUNC_NAME=lambda_health_check

LAMBDA_CODE=/home/ubuntu/jenkins/lambda-deployment/lambda-function/
TF_BASE=/home/ubuntu/jenkins/lambda-deployment/terraform

#backup & remove existing zip file
if [ -f $TF_BASE/$LAMBDA_FUNC_NAME.zip ]; then
    mv $TF_BASE/$LAMBDA_FUNC_NAME.zip $TF_BASE/backup/backup_$LAMBDA_FUNC_NAME.zip_`date +%G%m%d%H%M%S`
fi

cd $LAMBDA_CODE
zip -r9 $TF_BASE/$LAMBDA_FUNC_NAME.zip *

cd $TF_BASE

terraform plan -out execution.plan
terraform apply execution.plan
