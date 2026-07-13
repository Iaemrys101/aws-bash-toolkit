#!/bin/bash

echo "Enter the local file name:"
read -r file

echo "Enter the S3 bucket name:"
read -r bucket

if [ ! -f "$file" ]; then
    echo "File '$file' does not exist."
    exit 1
fi

if aws s3 cp "$file" "s3://$bucket/"
then
    echo "File uploaded successfully."
else
    echo "Upload failed."
    exit 1
fi
