#!/bin/bash

function lines {
        echo "*******************************************************"
}

echo "Enter the username"
read username
echo "Enter the uid number"
read uid_number

function username_right {
        [[ $username =~ [a-zA-Z] ]]
}
function username_wrong {
        [[ ! $username =~ [a-zA-Z] ]]
}
function uid_number_right {
        [[ $uid_number =~ ^[0-9]+$ ]]
}
function uid_number_wrong {
        [[ ! $uid_number =~ ^[0-9]+$ ]]
}

if [ -z "$username" ] || [ -z "$uid_number" ]
then
        if [ -n "$username" ] && [ -z "$uid_number" ]
        then
                lines
                echo "UID number field is empty"
        elif [ -z "$username" ] && [ -n "$uid_number" ]
        then
                lines
                echo "Username field is empty"
        elif [ -z "$username" ] && [ -z "$uid_number" ]
        then
                lines
                echo "Username field is empty"
                echo "UID number field is empty"
        else
                lines
                echo "Issues with the user input"
        fi
elif [ -n "$username" ] && [ -n "$uid_number" ]
then
        if username_wrong || uid_number_wrong
        then
                if username_right && uid_number_wrong
                then
                        lines
                        echo "UID number field must contain only numeric values"
                elif username_wrong && uid_number_right
                then
                        lines
                        echo "Username field must contain only alphabets"
                elif username_wrong && uid_number_wrong
                then
                        lines
                        echo "Username field must contain only alphabets"
                        echo "UID number field must contain only numeric values"
                else
                        lines
                        echo "Something went wrong while validation"
                fi
        elif username_right && uid_number_right
        then
                if [ "$username" == "root" ] || [ $uid_number -eq 0 ] || [ $uid_number -gt 65535 ]
                then
                        if [ "$username" == "root" ] && [ $uid_number -eq 0 ]
                        then
                                lines
                                echo "Username cannot be root"
                                echo "UID number cannot be 0"
                        elif [ "$username" == "root" ] && [ $uid_number -gt 65535 ]
                        then
                                lines
                                echo "Username cannot be root"
                                echo "UID number cannot be greather than 65535"
                        elif [ "$username" != "root" ] && [ $uid_number -eq 0 ]
                        then
                                lines
                                echo "UID number cannot be 0"
                        elif [ "$username" != "root" ] && [ $uid_number -gt 65535 ]
                        then
                                lines
                                echo "UID number cannot be greather than 65535"
                        elif [ "$username" == "root" ] && [ $uid_number -le 65535 ]
                        then
                                lines
                                echo "Username cannot be root"
                        fi
                elif [ "$username" != "root" ] && [ $uid_number -ne 0 ] && [ $uid_number -le 65535 ]
                then
                        cat /etc/passwd | grep -wi "$username" | cut -d ":" -f1 > ./username_lists
                        cat /etc/passwd | grep -wi "$uid_number" | cut -d ":" -f3 > ./uid_number_lists
                        if [ -s ./username_lists ] && [ -s ./uid_number_lists ]
                        then
                                lines
                                echo "Username is not available --> $username"
                                echo "UID number is not available --> $uid_number"
                        elif [ ! -s ./username_lists ] && [ -s ./uid_number_lists ]
                        then
                                lines
                                echo "Username is available --> $username"
                                echo "UID number is not available --> $uid_number"
                        elif [ -s ./username_lists ] && [ ! -s ./uid_number_lists ]
                        then
                                lines
                                echo "Username is not available --> $username"
                                echo "UID number is available --> $uid_number"
                        elif [ ! -s ./username_lists ] && [ ! -s ./uid_number_lists ]
                        then
                                lines
                                echo "Username is available --> $username"
                                echo "UID number is available --> $uid_number"
                        else
                                lines
                                echo "Issues while checking"

                        fi
                fi
        fi
fi
rm -rf ./1
rm -rf ./username_lists
rm -rf ./uid_number_lists
