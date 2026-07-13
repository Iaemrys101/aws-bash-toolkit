#!/bin/bash

echo "Enter the S3 bucket name:"
read -r bucket

if aws s3 rb "s3://$bucket"
then
    echo "Bucket deleted successfully."
else
    echo "Bucket deletion failed."
    exit 1
fi
