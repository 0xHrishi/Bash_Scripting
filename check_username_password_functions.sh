#!/bin/bash
# basic username and password check bash script 
# This script demonstrates how to use functions, loops,
# conditional statements, and user input in Bash.
# It validates username/password and limits login attempts.

#!/bin/bash

function lines {
        echo "******************************************************************************"
}

# Prompt the user for username and password
function user_input {
        read -p "Enter the username: " username
        read -sp "Enter the password: " password
        echo
}

# Ask user if they want to retry login after failure
function try_again {
        echo "Would you like to try again y/n?"
        read choice

        if [ "$choice" == "n" ]
        then
                lines
                echo "You choose to quit, bye"
                exit
        elif [ "$choice" == "y" ]
        then
                lines
                count=0
                while [ $count -le 3 ]
                do
                        user_input
                        validation_1
                        if [ "$username" != "admin" ] || [ "$password" != "root" ]
                        then
                                lines
                                echo "Incorrect credentials --> Login attempt failed"
                                echo
                                ((count++))
                                continue
                        elif [ "$username" == "admin" ] && [ "$password" == "root" ]
                        then
                                lines
                                echo "Login successfully"
                                break
                        fi

                done
        else
                lines
                echo "Invalid user input"
                exit
        fi
}

# Check if username or password fields are empty

function validation_1 {
        if [ -z "$username" ] || [ -z "$password" ]
        then
                if [ -n "$username" ] && [ -z "$password" ]
                then
                        lines
                        echo "User input -- Password field is empty"
                elif [ -z "$username" ] && [ -n "$password" ]
                then
                        lines
                        echo "User input -- Username field is empty"
                elif [ -z "$username" ] && [ -z "$password" ]
                then
                        lines
                        echo "User input -- Username field is empty"
                        echo "User input -- Password field is empty"
                fi
        fi
}

# credentials check
function authentication {
        if [ "$username" == "admin" ] && [ "$password" == "root" ]
        then
                lines
                echo "Login successfully"
        else
                lines
                echo "Incorrect credentials"
                try_again
        fi

}

# If both fields are filled, proceed to authentication
function validation_2 {
        if [ -n "$username" ] && [ -n "$password" ]
        then
                authentication
        fi
}

user_input
validation_1
validation_2
