#!/bin/bash

#scrit to check whether the username and uid is avialble for next use. 
#User input --> username and user identification number i.e UID

#User input --> $username
echo "Enter the username"
read username

#user input --> uid number
echo "Enter the UID number"
read uid_number

#function to display lines
function lines {
        echo "**************************************"
}

#created function to check that the username field must contain only alphabets
function username_right {
        [[ $username =~ [a-z] ]]
}
function username_wrong {
        [[ ! $username =~ [a-z] ]]
}

#created function to check that the username field must contain only numbers
function uid_number_right {
        [[ $uid_number =~ ^[0-9]+$ ]]
}
function uid_number_wrong {
        [[ ! $uid_number =~ ^[0-9]+$ ]]
}


#Check the user input whether the length of the string or the user input is empty or not
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
                echo "UID number field is empty"
                echo "Username field is empty"
        else
                lines
                echo "Issues with the user input"
        fi

#user input is not empty
#check whether the user input fits the user creteria i.e. username must contain only alphabets and uid only numeric values 

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
                        echo "UID number field must contain only numeric values"
                        echo "Username field must contain only alphabets"
                else
                        lines
                        echo "Issues with the user input validation"
                fi
        elif username_right && uid_number_right
        then
                #The UID number must not be equal to 0, not less than 999 and not greather than 65000
                if [ $uid_number -eq 0 ]
                then
                        lines
                        echo "User identification number cannot be 0"
                elif [ $uid_number -le 999 ]
                then
                        lines
                        echo "User identification number cannot be less than 999"

                #UID number is greather or equal to 1000 and less than 65000, proceed with checking 
                elif [ $uid_number -ge 1000 ] && [ $uid_number -le 65000 ]
                then
                        cat /etc/passwd | cut -d ":" -f1 | grep -i "$username" > ./username_lists
                        cat /etc/passwd | cut -d ":" -f3 | grep -i "$uid_number" > ./uid_number_lists
                        if [ ! -s ./username_lists ] && [ ! -s ./uid_number_lists ]
                        then
                                lines
                                echo "Username is available --> $username"
                                echo "UID number is available --> $uid_number"
                        elif [ -s ./username_lists ] && [ ! -s ./uid_number_lists ]
                        then
                                lines
                                echo "Username is not available --> $username"
                                echo "UID number is available --> $uid_number"
                        elif [ ! -s ./username_lists ] && [ -s ./uid_number_lists ]
                        then
                                lines
                                echo "Username is available --> $username"
                                echo "UID number is not available --> $uid_number"
                        elif [ -s ./username_lists ] && [ -s ./uid_number_lists ]
                        then
                                lines
                                echo "Username is not available --> $username"
                                echo "UID number is not available --> $uid_number"
                        else
                                lines
                                echo "Issues with the user input validation"
                        fi
                elif [ $uid_number -gt 65000 ]
                then
                        lines
                        echo "USER identification number cannot be greather than 65000"
                fi
        fi
fi

#Delete the files which were created and use for checking username and UID numbers

rm -rf ./username_lists
rm -rf ./uid_number_lists
rm -rf ./1
