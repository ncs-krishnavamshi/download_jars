#!/bin/bash

sourceBucket="my-bucket1007"
base_path="Software-Management/Installer"
sourcePath="In-progress/6.4_Oct2023_R1"
destinationPath="release"
version="$1"

sourceFile="s3://${sourceBucket}/${base_path}/${sourcePath}/apache-maven-3.9.4-bin.tar.gz"
destinationFile="s3://${sourceBucket}/${base_path}/${destinationPath}/${version}/apache-maven-3.9.4-bin.tar.gz"

aws s3 cp "$sourceFile" "$destinationFile"
exit_code=$?

if [ $exit_code -eq 0 ]; then
    echo "Successfully copied file of version $version"
else
    echo "Failed to copy file of version $version. Exit code: $exit_code"
fi
