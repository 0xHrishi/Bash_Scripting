#!/bin/bash
# Description: 
#   This script validates a username and UID number based on Linux rules:
#     - Username must contain only alphabets (no special chars/numbers).
#     - UID must be numeric.
#     - Username cannot be 'root'.
#     - UID cannot be 0 or greater than 60000.
#     - Checks availability of the username and UID in /etc/passwd.

function lines {
        echo "*************************************************"
}

# Function to check if UID input contains only numeric digits
function uid_number_right {
        [[ $uid_number =~ ^[0-9]+$ ]]
}
# Function to check if username input contains only alphabets
function username_right {
        [[ $username =~ [a-zA-Z] ]]
}

# Prompt user for username and UID
read -p "Enter the username: " username
read -p "Enter the UID number: " uid_number

# Check if input fields are empty
if [ -z "$username" ] || [ -z "$uid_number" ]
then
        if [ -n "$username" ] && [ -z "$uid_number" ]
        then
                lines
                echo "User input --> UID field is empty"
        elif [ -z "$username" ] && [ -n "$uid_number" ]
        then
                lines
                echo "User input --> Username field is empty"
        elif [ -z "$username" ] && [ -z "$uid_number" ]
        then
                lines
                echo "User input --> UID field is empty"
                echo "User input --> Username field is empty"
        fi

# If both inputs are provided
# If username and UID formats are correct
# If valid username and UID range -> check availability
elif [ -n "$username" ] && [ -n "$uid_number" ]
then
        if ! username_right || ! uid_number_right
        then
                if username_right && ! uid_number_right
                then
                        lines
                        echo "UID number field must contain only numeric values"
                elif ! username_right && uid_number_right
                then
                        lines
                        echo "Username field must contain only alphabets"
                elif ! username_right && ! uid_number_right
                then
                        lines
                        echo "UID number field must contain only numeric values"
                        echo "Username field must contain only alphabets"
                fi
        elif username_right && uid_number_right
        then
                if [ "$username" == "root" ] || [ $uid_number -eq 0 ] || [ $uid_number -gt 60000 ]
                then
                        if [ "$username" == "root" ] && [ "$uid_number" -eq 0 ]
                        then
                                lines
                                echo "Username cannot be root"
                                echo "UID number cannot be 0"
                        elif [ "$username" == "root" ] && [ "$uid_number" -gt 60000 ]
                        then
                                lines
                                echo "Username cannot be root"
                                echo "UID number greater than 60000"
                        elif [ "$username" != "root" ] && [ "$uid_number" -gt 60000 ]
                        then
                                lines
                                echo "UID number greater than 60000"
                        elif [ "$username" != "root" ] && [ "$uid_number" -eq 0 ]
                        then
                                lines
                                echo "UID number cannot be 0"
                        elif [ "$username" == "root" ] && [ $uid_number -gt 0 ] && [ $uid_number -le 6000 ]
                        then
                                lines
                                echo "Username cannot be root"
                        fi
                elif [ "$username" != "root" ] && [ $uid_number -gt 0 ] && [ $uid_number -le 60000 ]
                then
                        cat /etc/passwd | cut -d ":" -f1 | grep -i "$username" > ./username_lists
                        cat /etc/passwd | cut -d ":" -f3 | grep -i "$uid_number" > ./uid_number_lists
                        if [ -s ./username_lists ] && [ -s ./uid_number_lists ]
                        then
                                lines
                                echo "Username is not available: $username"
                                echo "UID number is not available: $uid_number"
                        elif [ ! -s ./username_lists ] && [ -s ./uid_number_lists ]
                        then
                                lines
                                echo "Username is available: $username"
                                echo "UID number is not available: $uid_number"
                        elif [ -s ./username_lists ] && [ ! -s ./uid_number_lists ]
                        then
                                lines
                                echo "Username is not available: $username"
                                echo "UID number is available: $uid_number"
                        elif [ ! -s ./username_lists ] && [ ! -s ./uid_number_lists ]
                        then
                                lines
                                echo "Username is available: $username"
                                echo "UID number is available: $uid_number"
                        fi
                fi
        fi
fi

# Cleanup temporary files
rm -rf ./username_lists
rm -rf ./uid_number_lists
rm -rf ./1
