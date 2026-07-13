#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../helpers.sh"

print_header "EC2 INSTANCES"

aws ec2 describe-instances \
    --query "Reservations[].Instances[].[Tags[?Key=='Name']|[0].Value,InstanceId,State.Name,InstanceType,PublicIpAddress]" \
    --output table \
    --no-cli-pager