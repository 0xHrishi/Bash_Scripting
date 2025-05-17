#!/bin/bash

#Script --> Check whether the username and User identificaton number is available or not 

#user input i.e. username and uid number i.e. user identification number

#!/bin/bash

function lines {
        echo "*******************************************"
}

echo "Enter the username"
read username
echo "Enter the UID number"
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
                        echo "Issues with user input validation"
                fi
        elif username_right && uid_number_right
        then
                if [ $username == "root" ] || [ $uid_number -eq 0 ] || [ $uid_number -gt 65535 ]
                then
                        if [ $username == "root" ] && [ $uid_number -eq 0 ]
                        then
                                lines
                                echo "Username cannot be $username"
                                echo "UID number cannot be $uid_number"
                        elif [ $username == "root" ] && [ $uid_number -gt 65535 ]
                        then
                                lines
                                echo "Username cannot be $username"
                                echo "UID number cannot be greather than $uid_number"
                        elif [ $username != "root" ] && [ $uid_number -gt 65535 ]
                        then
                                lines
                                echo "UID number cannot be greather than $uid_number"
                        elif [ $username != "root" ] && [ $uid_number -eq 0 ]
                        then
                                lines
                                echo "UID number cannot be zero"
                        elif [ $username == "root" ] && [ $uid_number -lt 65535 ]
                        then
                                lines
                                echo "Username cannot be --> $username"
                        fi
                elif [ $username != "root" ] && [ $uid_number -ne 0 ] && [ $uid_number -le 65535 ]
                then
                        cat /etc/passwd | cut -d ":" -f1 | grep -i "$username" > ./username_lists
                        cat /etc/passwd | cut -d ":" -f3 | grep -i "$uid_number" > ./uid_number_lists
                        if [ -s ./username_lists ] && [ -s ./uid_number_lists ]
                        then
                                lines
                                echo "Username not available --> $username"
                                echo "UID number not available --> $uid_number"
                        elif [ ! -s ./username_lists ] && [ -s ./uid_number_lists ]
                        then
                                lines
                                echo "Username available --> $username"
                                echo "UID number not available --> $uid_number"
                        elif [ -s ./username_lists ] && [ ! -s ./uid_number_lists ]
                        then
                                lines
                                echo "Username not available --> $username"
                                echo "UID number available --> $uid_number"
                        elif [ ! -s ./username_lists ] && [ ! -s ./uid_number_lists ]
                        then
                                lines
                                echo "Username available --> $username"
                                echo "UID number available --> $uid_number"
                        else
                                lines
                                echo "Issues with the user input"
                        fi
                fi
        fi
fi
rm -rf ./1
rm -rf ./username_lists
rm -rf ./uid_number_lists

