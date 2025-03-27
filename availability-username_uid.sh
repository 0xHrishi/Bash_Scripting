#!/bin/bash

#Script --> Check whether the username and User identificaton number is available or not 

#user input i.e. username and uid number i.e. user identification number

echo "Enter the username"
read username
echo "Enter the UID number"
read uid_number

function lines {
        echo "*****************************************"
}

#function to check that the username field must contain only alphabets
function username_right {
        [[ $username =~ [a-zA-Z] ]]
}
function username_wrong {
        [[ ! $username =~ [a-zA-Z] ]]
}

#function to check the uid_number field must contain only numeric values
function uid_number_right {
        [[ $uid_number =~ ^[0-9]+$ ]]
}
function uid_number_wrong {
        [[ ! $uid_number =~ ^[0-9]+$ ]]
}

#Check if the user input field is empty
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

#user input is not empty
elif [ -n "$username" ] && [ -n "$uid_number" ]
then
        #user input validation i.e. to check whether the username and uid number field contain desired user input
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
                        echo "UID number field must contain only numeric values"
                        echo "Username field must contain only alphabets"
                else
                        lines
                        echo "Issues with user input validation"
                fi

        #correct input from the user 
        elif username_right && uid_number_right
        then
                if [ $uid_number -eq 0 ] || [ "$username" == "root" ]
                then
                        if [ $uid_number -eq 0 ] && [ "$username" == "root" ]
                        then
                                lines
                                echo "Username cannot be root"
                                echo "UID number cannot be zero"
                        elif [ $uid_number -ne 0 ] && [ "$username" == "root" ]
                        then
                                lines
                                echo "Username cannot be root"
                        elif [ $uid_number -eq 0 ] && [ "$username" != "root" ]
                        then
                                lines
                                echo "UID number cannot be zero"
                        fi
                elif [ $uid_number -ne 0 ] || [ "$username" != "root" ]
                then
                        if [ $uid_number -gt 65000 ]
                        then
                                lines
                                echo "UID number cannot be greather than 65000"
                        elif [ $uid_number -le 65000 ]
                        then

                                #username and uid number gets re-directed to a new file 
                                cat /etc/passwd | cut -d ":" -f1 | grep -wi "$username" > ./username_lists
                                cat /etc/passwd | cut -d ":" -f3 | grep -wi "$uid_number" > ./uid_number_lists
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
                                        echo "Something went wrong while checking"
                                fi
                        fi
                fi
        fi
fi
rm -rf ./username_lists
rm -rf ./uid_number_lists
rm -rf ./1
