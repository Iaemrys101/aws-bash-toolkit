#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../helpers.sh"

print_header "EC2 INSTANCE DETAILS"

echo "Enter the Instance ID:"
read -r instance_id

if [[ "$instance_id" != i-* ]]; then
    print_error "Invalid Instance ID. It should begin with i-"
    exit 1
fi

if aws ec2 describe-instances \
    --instance-ids "$instance_id" \
    --query "Reservations[].Instances[].{Name:Tags[?Key=='Name']|[0].Value,InstanceId:InstanceId,State:State.Name,Type:InstanceType,PublicIP:PublicIpAddress,PrivateIP:PrivateIpAddress,AvailabilityZone:Placement.AvailabilityZone}" \
    --output table \
    --no-cli-pager
then
    print_success "Instance details retrieved successfully."
else
    print_error "Could not retrieve the instance."
    exit 1
fi