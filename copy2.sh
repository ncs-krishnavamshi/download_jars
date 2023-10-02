#!/bin/bash

sourceBucket="my-bucket1007"
base_path="Software-Management/Installer"
sourcePath="In-progress/6.4_Oct2023_R1"
destinationPath="release"
promoteChoice="$1"
version="$2"

echo "promoteChoice: $promoteChoice"
echo "version: $version"

if [ "$promoteChoice" = "SNYPR" ]; then
    aws s3 cp "s3://${sourceBucket}/${base_path}/${sourcePath}/${version}/apache-maven-3.9.4-bin.tar.gz" "s3://${sourceBucket}/${base_path}/${destinationPath}/${version}/apache-maven-3.9.4-bin.tar.gz" --recursive
    exit_code=$?
    if [ $exit_code -eq 0 ]; then
        echo "Promoting $promoteChoice file of version $version"
    else
        echo "Failed to promote $promoteChoice file of version $version. Exit code: $exit_code"
    fi
elif [ "$promoteChoice" = "RIN" ]; then
    # Uncomment and add the AWS S3 promotion logic for RIN files here
    echo "Promoting $promoteChoice file of version $version"
elif [ "$promoteChoice" = "RIN-Upgrade" ]; then
    # Uncomment and add the AWS S3 promotion logic for RIN-Upgrade files here
    echo "Promoting $promoteChoice file of version $version"
else
    echo "Invalid choice"
fi
