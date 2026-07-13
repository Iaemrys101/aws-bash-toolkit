#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/helpers.sh"

while true
do
    clear

    print_header "AWS CLOUD TOOLKIT"

    echo "1. Create S3 Bucket"
    echo "2. List S3 Buckets"
    echo "3. Upload File to S3"
    echo "4. Download File from S3"
    echo "5. Delete S3 Bucket"
    echo "6. List EC2 Instances"
    echo "7. Start EC2 Instance"
    echo "8. Stop EC2 Instance"
    echo "9. Exit"
    echo "=============================================="

    echo "Choose an option:"
    read -r choice

    case "$choice" in
        1)
            "$SCRIPT_DIR/create_bucket.sh"
            ;;
        2)
            aws s3 ls
            ;;
        3)
            "$SCRIPT_DIR/upload_file.sh"
            ;;
        4)
            "$SCRIPT_DIR/download_file.sh"
            ;;
        5)
            "$SCRIPT_DIR/delete_bucket.sh"
            ;;
        6)
            "$SCRIPT_DIR/ec2/list_instances.sh"
            ;;
        7)
            "$SCRIPT_DIR/ec2/start_instance.sh"
            ;;
        8)
            "$SCRIPT_DIR/ec2/stop_instance.sh"
            ;;
        9)
            print_success "Exiting AWS Toolkit."
            exit 0
            ;;
        *)
            print_error "Invalid option. Choose 1 to 9."
            ;;
    esac

    echo
    echo "Press Enter to continue..."
    read -r
done
