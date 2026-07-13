#!/bin/bash

GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[1;33m"
BLUE="\033[0;34m"
RESET="\033[0m"

print_header() {
    echo "=============================================="
    echo "$1"
    echo "=============================================="
}

print_success() {
    echo -e "${GREEN}$1${RESET}"
}

print_error() {
    echo -e "${RED}$1${RESET}"
}

print_warning() {
    echo -e "${YELLOW}$1${RESET}"
}

print_info() {
    echo -e "${BLUE}$1${RESET}"
}