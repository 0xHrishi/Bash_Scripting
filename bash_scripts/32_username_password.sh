#!/bin/bash
#basic script to check username and password credentials

function lines {
        echo "**************************************"
}

function user_input {
        read -p "Enter the username: " username
        read -sp "Enter the password: " password
}

function try_again {
        lines
        echo "Would you like to try again ? y/n"
        read option

        if [ "$option" == "n" ]
        then
                lines
                echo "You choose not to continue, bye"
        elif [ "$option" == "y" ]
        then
                user_input
                validation_1
                validation_2
        else
                echo "Invalid user input"
        fi
}

function validation_1 {
        if [ -z "$username" ] || [ -z "$password" ]
        then
                if [ -n "$username" ] && [ -z "$password" ]
                then
                        lines
                        echo "User input --> Password field is empty"
                        try_again
                elif [ -z "$username" ] && [ -n "$password" ]
                then
                        lines
                        echo "User input --> Username field is empty"
                        try_again
                elif [ -z "$username" ] && [ -z "$password" ]
                then
                        lines
                        echo "User input --> Username field is empty"
                        echo "User input --> Password field is empty"
                        try_again
                fi
        fi
}

function validation_2 {
        if [ -n "$username" ] && [ -n "$password" ]
        then
                if [ "$username" == "admin" ] && [ "$password" == "password" ]
                then
                        lines
                        echo "Login success"
                else
                        lines
                        echo "Invalid credentials"
                        try_again
                fi
        fi
}
user_input
validation_1
validation_2

