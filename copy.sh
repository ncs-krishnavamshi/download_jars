#!/bin/bash

# Define your AWS credentials
awsAccessKeyId="AKIA54ICCSKT2FLDLT56"
awsSecretAccessKey="6naH/HRUHg4yVXSL4+CihgNcctcmgfD0inbGGJ3J"

# Set AWS CLI environment variables
export AWS_ACCESS_KEY_ID="$awsAccessKeyId"
export AWS_SECRET_ACCESS_KEY="$awsSecretAccessKey"

# Source and destination S3 bucket and paths
sourceBucket="my-bucket1007"
base_path="Software-Management/Installer/"
sourcePath="In-progress/"
destinationPath="release/"

# Use the AWS CLI to copy files
aws s3 cp "s3://${sourceBucket}/${base_path}/${sourcePath}" "s3://${sourceBucket}/${base_path}/${destinationPath}" --recursive
