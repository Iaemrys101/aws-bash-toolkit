#!/bin/bash

echo "Enter the bucket name:"
read -r bucket

echo "Enter the file name in S3:"
read -r file

echo "Downloading..."

if aws s3 cp "s3://$bucket/$file" .
then
    echo "✅ Download completed."
else
    echo "❌ Download failed."
fi
