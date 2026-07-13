#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../helpers.sh"

print_header "START EC2 INSTANCE"

print_warning "Starting an EC2 instance may create AWS charges."

echo "Enter the Instance ID:"
read -r instance_id

print_info "Starting instance..."

if aws ec2 start-instances \
    --instance-ids "$instance_id" \
    --output table \
    --no-cli-pager
then
    print_success "Instance start request sent successfully."
else
    print_error "Failed to start the instance."
    exit 1
fi