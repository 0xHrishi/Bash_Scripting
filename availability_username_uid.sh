#!/bin/bash

# -----------------------------------------------
# Simple User/UID Validation Script
# -----------------------------------------------
# Validates:
#   - username must start with lowercase letter
#   - username may contain A-Z a-z 0-9
#   - UID must be numeric, cannot start with zero
#   - UID must NOT exceed 65500
#   - Username "root" is not allowed
#   - Checks if username/UID already exist in /etc/passwd

function lines {
        echo "**********************************************************************"
}

# Username must start with [a-z], followed by alphanumeric characters
# UID must be numeric, cannot start with 0

function username_check {
        [[ $username =~ ^[a-z][a-zA-Z0-9]*$ ]]
}
function uid_number_check {
        [[ $uid_number =~ ^[1-9][0-9]*$ ]]
}

lines
echo "Username must start with a lowercase letter (a-z)"
lines
sleep 0.5

# User input
read -p "Enter the username: " username
read -p "Enter the UID number: " uid_number

# -------------------------------------------------------------
# Empty Input Checks
# -------------------------------------------------------------
if [ -z "$username" ] || [ -z "$uid_number" ]
then
        if [ -n "$username" ] && [ -z "$uid_number" ]
        then
                lines
                echo "User input -- UID number field is empty"
        elif [ -z "$username" ] && [ -n "$uid_number" ]
        then
                lines
                echo "User input -- Username field is empty"
        elif [ -z "$username" ] && [ -z "$uid_number" ]
        then
                lines
                echo "User input -- Username field is empty"
                echo "User input -- UID number field is empty"
        fi

# -------------------------------------------------------------
# Input Checks
# Username must not be root and UID number must not be greater than 65000
# -------------------------------------------------------------

elif [ -n "$username" ] && [ -n "$uid_number" ]
then
        if ! username_check || ! uid_number_check
        then
                if username_check && ! uid_number_check
                then
                        lines
                        echo "User input -- Invalid UID number input"
                elif ! username_check && uid_number_check
                then
                        lines
                        echo "User input -- Invalid username input"
                elif ! username_check && ! uid_number_check
                then
                        lines
                        echo "User input -- Invalid username input"
                        echo "User input -- Invalid UID number input"
                fi
        elif username_check && uid_number_check
        then
                if [ "$username" == "root" ] || [ $uid_number -gt 65500 ]
                then
                        if [ "$username" == "root" ] && [ $uid_number -gt 65500 ]
                        then
                                lines
                                echo "Username cannot be root"
                                echo "UID number cannot be greater than 65500"
                        elif [ "$username" == "root" ] && [ $uid_number -lt 65500 ]
                        then
                                lines
                                echo "Username cannot be root"
                        elif [ "$username" != "root" ] && [ $uid_number -gt 65500 ]
                        then
                                lines
                                echo "UID number cannot be greater than 65500"
                        fi
                elif [ "$username" != "root" ] && [ $uid_number -le 65500 ]
                then
                        cat /etc/passwd | grep -w "$username" | cut -d ":" -f1 > ./username_lists
                        cat /etc/passwd | grep -w "$uid_number" | cut -d ":" -f3 > ./uid_number_lists

                        if [ -s ./username_lists ] && [ -s ./uid_number_lists ]
                        then
                                lines
                                echo "Username not available -- $username"
                                echo "UID number not available -- $uid_number"
                        elif [ ! -s ./username_lists ] && [ -s ./uid_number_lists ]
                        then
                                lines
                                echo "Username available -- $username"
                                echo "UID number not available -- $uid_number"
                        elif [ -s ./username_lists ] && [ ! -s ./uid_number_lists ]
                        then
                                lines
                                echo "Username not available -- $username"
                                echo "UID number available -- $uid_number"
                        elif [ ! -s ./username_lists ] && [ ! -s ./uid_number_lists ]
                        then
                                lines
                                echo "Username available -- $username"
                                echo "UID number available -- $uid_number"
                        fi
                fi
        fi
fi
rm -rf ./username_lists
rm -rf ./uid_number_lists
