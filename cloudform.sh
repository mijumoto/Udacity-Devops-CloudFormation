#!/bin/bash

# Parameters:
# $1 create, delete or update stack
# $2 Stack name
# $3 Template body
# $4 Parameters file

# Example: ./cloudform.sh create stackName infra.yml infra.json
# Example: ./cloudform.sh delete stackName
# Example: ./cloudform.sh update stackName servers.yml servers.json

REGION="--region=us-east-1"
CAPABILITIES='--capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM"'
if [ "$1" = "create" ]; then
	aws cloudformation create-stack --stack-name $2 --template-body file://$3  --parameters file://$4 $CAPABILITIES $REGION
if [ "$1" = "delete" ]; then
	aws cloudformation delete-stack --stack-name $2
if [ "$1" = "update" ]; then
	aws cloudformation update-stack --stack-name $2 --template-body file://$3  --parameters file://$4 $CAPABILITIES $REGION
fi