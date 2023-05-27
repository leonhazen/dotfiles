#!/usr/bin/env sh
# Set or get values from the OSX keychain
# Usage: keychain.sh [get|set] [key]

# If not enough arguments are provided, then show usage
if [ $# -lt 2 ]; then
    echo "Usage: keychain.sh [get|set] [key]"
    exit 1
fi

# If the first argument is "get", then get the value from the keychain
if [ "$1" = "get" ]; then
    security find-generic-password -a ${USER} -s "${2}" -w 2>/dev/null
    
    # If the exit code is 44, then the keychain item doesn't exist
    if [ $? -eq 44 ]; then
        echo "No value found for ${2}"
        exit 1
    fi
    
    exit 0
fi

# If the first argument is "set", then set the value in the keychain
if [ "$1" = "set" ]; then
    secret=$(gum input --password --prompt "Enter value for ${2}: ")
    
    if [ -z "${secret}" ]; then
        echo "No value provided"
        exit 1
    fi

    security add-generic-password -U -a ${USER} -s "${2}" -w "${secret}"
    exit 0
fi