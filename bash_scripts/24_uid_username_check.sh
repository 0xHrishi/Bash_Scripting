#!/bin/bash

# Description:
#   This script validates a Linux username and UID number input by the user.
#   It performs the following checks:
#     1. Ensures username is non-empty and starts with an alphabet, followed by
#        alphanumeric characters only.
#     2. Ensures UID number is non-empty and a positive integer (no leading zero).
#     3. Checks that the username is not "root" and UID is <= 65000.
#     4. Checks if the username and UID already exist in the system (/etc/passwd).
#   Displays messages in colored output for better readability.

function lines {
        echo "****************************************************************"
}

# color codes for error messages
RED='\033[0;31m'
NF='\033[0m'

# Function to check user input 
# username_check -- start with a lowercase alphabet, followed by alphanumeric characters
# uid_number_check -- # UID must be a positive integer (no leading zero)
function username_check {
        [[ $username =~ ^[a-z][a-z0-9]*$ ]]
}
function uid_number_check {
        [[ $uid_number =~ ^[1-9][0-9]*$ ]]
}

# prompt for user input
read -p "Enter the username: " username
read -p "Enter the UID number: " uid_number

# check is input is empty
if [ -z "$username" ] || [ -z "$uid_number" ]
then
        lines
        if [ -z "$username" ]
        then
                echo -e "${RED}User input --> Username field is empty${NF}"
        fi
        if [ -z "$uid_number" ]
        then
                echo -e "${RED}User input --> UID number field is empty${NF}"
        fi

# user input not empty
# validate user input
# 
elif [ -n "$username" ] && [ -n "$uid_number" ]
then
        lines
        if ! username_check || ! uid_number_check
        then
                if ! username_check
                then
                        echo -e "${RED}Username field must contain alphanumeric values${NF}"
                fi
                if ! uid_number_check
                then
                        echo -e "${RED}UID number field must contain only numeric values${NF}"
                fi
        elif username_check && uid_number_check
        then
                if [ "$username" == "root" ] || [ $uid_number -gt 65000 ]
                then
                        if [ "$username" == "root" ]
                        then
                                echo -e "${RED}Username cannot be root${NF}"
                        fi
                        if [ $uid_number -gt 65000 ]
                        then
                                echo -e "${RED}UID number cannot be greater than 65000${NF}"
                        fi
                elif [ "$username" != "root" ] && [ $uid_number -le 65000 ]
                then

                        cat /etc/passwd | cut -d ":" -f1 | grep -w "$username" > ./username_lists
                        cat /etc/passwd | cut -d ":" -f3 | grep -w $uid_number > ./uid_number_lists

                        if [ -s ./username_lists ]
                        then
                                echo -e "${RED}Username is not available --> $username${NF}"
                        else
                                echo "Username is available --> $username"
                        fi

                        if [ -s ./uid_number_lists ]
                        then
                                echo -e "${RED}UID number is not available --> $uid_number${NF}"
                        else
                                echo "UID number is available --> $uid_number"
                        fi
                fi
        fi
fi
# Cleanup temporary files
rm -rf ./username_lists
rm -rf ./uid_number_lists
