#!/bin/bash

function lines {
        echo "*******************************************************"
}


echo "Enter the username"
read username
echo "Enter the password"
read password

function try_again {
        lines
        echo "Would you like to try again y/n ?"
        read option
        if [ "$option" == "y" ]
        then
                count=0
                while [ $count -le 3 ]
                do
                        echo "Enter username"
                        read username
                        echo "Enter password"
                        read password
                        if [ "$username" == "root" ] && [ "$password" == "pass" ]
                        then
                                lines
                                echo "Login successfuly"
                                exit
                        elif [ $count -eq 3 ]
                        then
                                lines
                                echo "Account lock for 5 minustes"
                                echo "Bye for now"
                                exit
                        else
                                echo "Invalid credentials"
                                ((count++))
                                continue
                        fi
                done
        elif [ "$option" == "n" ]
        then
                echo "Bye for now"
                exit
        else
                echo "Invalid option"
                exit
        fi
}

if [ -z "$username" ] || [ -z "$password" ]
then
        if [ -n "$username" ] && [ -z "$password" ]
        then
                lines
                echo "Password field is empty"
        elif [ -z "$username" ] && [ -n "$password" ]
        then
                lines
                echo "Username field is empty"
        elif [ -z "$username" ] && [ -z "$password" ]
        then
                lines
                echo "Username field is empty"
                echo "Password field is empty"
        else
                lines
                echo "Issues with the user input"
        fi
elif [ -n "$username" ] && [ -n "$password" ]
then
        if [ "$username" == "root" ] && [ "$password" == "pass" ]
        then
                lines
                echo "Login successful"
        elif [ "$username" != "root" ] || [ "$password" != "pass" ]
        then
                lines
                echo "Login un-successful"
                try_again
        else
                lines
                echo "Issues with validation"
        fi
fi
