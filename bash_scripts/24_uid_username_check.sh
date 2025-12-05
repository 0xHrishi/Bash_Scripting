#!/bin/bash
# This script allows the user to enter a Linux username and UID number.
# It validates:
#   - Username: must start with a lowercase letter, only letters and numbers allowed, no special characters
#   - UID number: must be numeric and positive
#   - Disallows: username "root", UID 0, UID greater than 65000
# It also checks if the username or UID already exists in the system.


function lines {
        echo "*************************************************************"
}

# Function to validate username i.e. username_check and uid number i.e. uid_number_check
# Rules:
#   - Starts with lowercase letter
#   - Contains only letters and digits
#   - UID number input Must be numeric
function username_check {
        [[ $username =~ ^[a-z][a-zA-Z0-9]*$ ]]
}

function uid_number_check {
        [[ $uid_number =~ ^[0-9]+$ ]]
}

# Pormpt user for the input
read -p "Enter the username: " username
read -p "Enter the UID number: " uid_number


# User input empty
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
                echo "USer input -- UID number field is empty"
        fi
# User input supplied
# Validate username and UID format 
# Check if username or UID already exists in the system 
elif [ -n "$username" ] && [ -n "$uid_number" ]
then
        if ! username_check || ! uid_number_check
        then
                if username_check && ! uid_number_check
                then
                        lines
                        echo "UID number field must contain only numeric values(positive)"
                elif ! username_check && uid_number_check
                then
                        lines
                        echo "Username field must contain first alpabets and next numeric values"
                        echo "No special characters"
                elif ! username_check && ! uid_number_check
                then
                        lines
                        echo "Username field must contain first alpabets and next numeric values"
                        echo "No special characters"
                        echo "UID number field must contain only numeric values(positive)"
                fi
        elif username_check && uid_number_check
        then
                if [ "$username" == "root" ] || [ $uid_number -eq 0 ] || [ $uid_number -gt 65000 ]
                then
                        if [ "$username" == "root" ] && [ $uid_number -eq 0 ]
                        then
                                lines
                                echo "Username cannot be root"
                                echo "UID number cannot be 0"
                        elif [ "$username" != "root" ] && [ $uid_number -eq 0 ]
                        then
                                lines
                                echo "UID number cannot be 0"
                        elif [ "$username" == "root" ] && [ $uid_number -ne 0 ] && [ $uid_number -le 65000 ]
                        then
                                lines
                                echo "Username cannot be root"
                        elif [ "$username" != "root" ] && [ $uid_number -gt 65000 ]
                        then
                                lines
                                echo "UID number cannot be greater than 65000"
                        elif [ "$username" == "root" ] && [ $uid_number -ge 65000 ]
                        then
                                lines
                                echo "Username cannot be root"
                                echo "UID number cannot be greater than 65000"
                        fi
                elif [ "$username" != "root" ] || [ $uid_number -ne 0 ] || [ $uid_number -le 65000 ]
                then
                        cat /etc/passwd | cut -d ":" -f1 | grep -wi "$username" > ./username_list
                        cat /etc/passwd | cut -d ":" -f3 | grep -wi "$uid_number" > ./uid_number_list

                        if [ -s ./username_list ] && [ -s ./uid_number_list ]
                        then
                                lines
                                echo "Username not available --> $username"
                                echo "UID number not available --> $uid_number"
                        elif [ ! -s ./username_list ] && [ -s ./uid_number_list ]
                        then
                                lines
                                echo "Username available --> $username"
                                echo "UID number not available --> $uid_number"
                        elif [ -s ./username_list ] && [ ! -s ./uid_number_list ]
                        then
                                lines
                                echo "Username not available --> $username"
                                echo "UID number available --> $uid_number"
                        elif [ ! -s ./username_list ] && [ ! -s ./uid_number_list ]
                        then
                                lines
                                echo "Username available --> $username"
                                echo "UID number available --> $uid_number"
                        fi
                fi
        fi
fi
rm -rf ./username_list
rm -rf ./uid_number_list
