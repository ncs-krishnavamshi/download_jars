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
promoteChoice="$1"
version="$2"
echo "promoteChoice: $promoteChoice"
echo "version: $version"
if [ "$promoteChoice" = "SNYPR" ]; then
aws s3 cp "s3://${sourceBucket}/${base_path}/${sourcePath}/${2}/apache-maven-3.9.4-bin.tar.gz" "s3://${sourceBucket}/${base_path}/${destinationPath}/${2}/apache-maven-3.9.4-bin.tar.gz" --recursive
    echo "Promoting version $version"
    else
    echo "Invalid choice"
    fi