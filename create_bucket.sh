#!/bin/bash

echo "=================================="
echo "      AWS S3 Bucket Creator"
echo "=================================="

echo "Enter a globally unique bucket name:"
read bucket

echo "Enter AWS region (e.g. eu-west-2):"
read region

echo "Creating bucket..."

if aws s3api create-bucket \
    --bucket "$bucket" \
    --region "$region" \
    --create-bucket-configuration LocationConstraint="$region"
then
    echo ""
    echo "✅ Bucket created successfully!"
else
    echo ""
    echo "❌ Bucket creation failed."
fi
