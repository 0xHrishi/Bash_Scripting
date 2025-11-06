#!/bin/bash

# Description: This script validates username and UID number and display whether it is available or not for the new user.

# Function: Draws a separator line for clarity in output
function lines {
        echo "******************************************************************************"
}

# Function to check user input i.e. username and uid number
# username can include alphabets only or alpahbets plus numeric values
# uid number must contain only numeric values
function username_check {
        [[ $username =~ ^[a-zA-Z0-9]+$ && $username =~ [a-zA-Z] ]]
}

function uid_number_check {
        [[ $uid_number =~ ^[0-9]+$ ]]
}

# USer prompt
read -p "Enter username: " username
read -p "Enter the UID number: " uid_number

# Check if user input is empty
if [ -z "$username" ] || [ -z "$uid_number" ]
then
        if [ -n "$username" ] && [ -z "$uid_number" ]
        then
                lines
                echo "User input --> UID number field is empty"
        elif [ -z "$username" ] && [ -n "$uid_number" ]
        then
                lines
                echo "User input --> Username field is empty"
        elif [ -z "$username" ] && [ -z "$uid_number" ]
        then
                lines
                echo "User input --> Username field is empty"
                echo "User input --> UID number field is empty"
        fi

# Both fields are filled, proceed with format validation
# Check for restricted or invalid UID conditions
# If username is not root and UID is within range

elif [ -n "$username" ] && [ -n "$uid_number" ]
then
        if ! username_check || ! uid_number_check
        then
                if username_check && ! uid_number_check
                then
                        lines
                        echo "UID number must contain numeric values"
                elif ! username_check && uid_number_check
                then
                        lines
                        echo "Username field must contain numeric and alphabets values or only aplabets"
                elif ! username_check && ! uid_number_check
                then
                        lines
                        echo "Username field must contain numeric and alphabets values or only aplabets"
                        echo "UID number must contain numeric values"
                fi
        elif username_check && uid_number_check
        then
                if [ "$username" == "root" ] || [ $uid_number -eq 0 ] || [ $uid_number -gt 60000 ]
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
                        elif [ "$username" == "root" ] && [ $uid_number -gt 60000 ]
                        then
                                lines
                                echo "Username cannot be root"
                                echo "UID number cannot be greather than 60000"
                        elif [ "$username" != "root" ] && [ $uid_number -gt 60000 ]
                        then
                                lines
                                echo "UID number cannot be greather than 60000"
                        elif [ "$username" == "root" ] && [ $uid_number -le 60000 ]
                        then
                                lines
                                echo "Username cannot be root"
                        fi
                elif [ "$username" != "root" ] && [ $uid_number -ne 0 ] && [ $uid_number -le 60000 ]
                then
                        cat /etc/passwd | cut -d ":" -f1 | grep -i "$username" > ./username_list
                        cat /etc/passwd | cut -d ":" -f3 | grep -i "$uid_number" > ./uid_number_list

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

# Cleanup temporary files
rm -rf ./username_list
rm -rf ./uid_number_list
