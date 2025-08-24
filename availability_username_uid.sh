#!/bin/bash
#script takes input such as Username and UID number, to check whether it already exist or not. 

#function 
function lines {
        echo "*********************************************"
}

#scrip short description
echo "Script --> Check whether username and UID is available"
sleep 0.2

#user input
read -p "Enter username: " username
read -p "Enter UID number: " uid_number

#functions to check that the user input i.e username must contain only alphanumeric values 
#function to check UID number must contain only integers
function username_correct {
        [[ $username =~ ^[a-zA-Z0-9]+$ ]]
}
function username_wrong {
        [[ ! $username =~ ^[a-zA-Z0-9]+$ ]]
}

function uid_number_correct {
        [[ $uid_number =~ ^[0-9]+$ ]]
}
function uid_number_wrong {
        [[ ! $uid_number =~ ^[0-9]+$ ]]
}

#Check whether the user input is empty 
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

#user input is not empty 
# username input must not contain root user name 
#uid number cannot be equal to 0 and greater than 65535
#If the username is root and uid number is not equal to 0 and greater than 65535
# -s --> Means file exist and the file size is greater than 0 bytes
# ! -s --> means file exist and the file size is 0 bytes 

elif [ -n "$username" ] && [ -n "$uid_number" ]
then
        if username_wrong || uid_number_wrong
        then
                if username_correct && uid_number_wrong
                then
                        lines
                        echo "UID number field must contain only numeric values"
                elif username_wrong && uid_number_correct
                then
                        lines
                        echo "Username field must contain alpha-numeric values"
                elif username_wrong && uid_number_wrong
                then
                        lines
                        echo "Username field must contain alpha-numeric values"
                        echo "UID number field must contain only numeric values"
                fi
        elif username_correct && uid_number_correct
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
                                echo "UID number greater than 65535"
                        elif [ "$username" != "root" ] && [ $uid_number -gt 65535 ]
                        then
                                lines
                                echo "UID number cannot be greater than 65535"
                        elif [ "$username" != "root" ] && [ $uid_number -eq 0 ]
                        then
                                lines
                                echo "UID number cannot be zero"
                        elif [ "$username" == "root" ] && [ $uid_number -ne 0 ] && [ $uid_number -le 65535 ]
                        then
                                lines
                                echo "Username cannot be root"
                        fi
                elif [ "$username" != "root" ] && [ $uid_number -ne 0 ] || [ $uid_number -le 65535 ]
                then
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
                        fi
                fi
        fi
fi
rm -rf ./1
rm -rf ./username_lists
rm -rf ./uid_number_lists
