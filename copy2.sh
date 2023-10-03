#!/bin/bash

# Define the source buckets
sourceBucketSNYPR="bucket-snypr"
sourceBucketRIN="bucket-rin"
sourceBucketRINUpgrade="bucket-rin-upgrade"

# Define the base paths within each bucket
basePathSNYPR="Software-Management/Installer"
basePathRIN="Software-Management/Installer"
basePathRINUpgrade="Software-Management/Installer"

# Define the source paths within each base path
sourcePathSNYPR="In-progress/6.4_Oct2023_R1"
sourcePathRIN="In-progress/6.4_Oct2023_R1"
sourcePathRINUpgrade="In-progress/6.4_Oct2023_R1"

# Define the destination path common for all buckets
destinationPath="release"

# Get the promotion choice and version from command-line arguments
promoteChoice="$1"
version="$2"

# Check the promotion choice and perform the corresponding copy operation
if [ "$promoteChoice" = "SNYPR" ]; then
    sourceBucket="$sourceBucketSNYPR"
    basePath="$basePathSNYPR"
    sourcePath="$sourcePathSNYPR"
elif [ "$promoteChoice" = "RIN" ]; then
    sourceBucket="$sourceBucketRIN"
    basePath="$basePathRIN"
    sourcePath="$sourcePathRIN"
elif [ "$promoteChoice" = "RIN-Upgrade" ]; then
    sourceBucket="$sourceBucketRINUpgrade"
    basePath="$basePathRINUpgrade"
    sourcePath="$sourcePathRINUpgrade"
else
    echo "Invalid choice"
    exit 1
fi

# Construct source and destination paths
sourceFile="s3://${sourceBucket}/${basePath}/${sourcePath}/apache-maven-3.9.4-bin.tar.gz"
destinationFile="s3://${sourceBucket}/${basePath}/${destinationPath}/${version}/apache-maven-3.9.4-bin.tar.gz"

# Perform the file copy
aws s3 cp "$sourceFile" "$destinationFile"
exit_code=$?

if [ $exit_code -eq 0 ]; then
    echo "Successfully copied file of version $version from $promoteChoice"
else
    echo "Failed to copy file of version $version from $promoteChoice. Exit code: $exit_code"
fi
