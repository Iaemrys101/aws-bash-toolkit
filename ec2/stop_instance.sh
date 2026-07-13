#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../helpers.sh"

print_header "STOP EC2 INSTANCE"

echo "Enter the Instance ID:"
read -r instance_id

print_info "Stopping instance..."

if aws ec2 stop-instances \
    --instance-ids "$instance_id" \
    --output table \
    --no-cli-pager
then
    print_success "Instance stop request sent successfully."
else
    print_error "Failed to stop the instance."
    exit 1
fi