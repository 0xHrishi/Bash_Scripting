#!/bin/bash
# basic username and password check bash script 

function lines {
        echo "*************************************************"
}

# Function to capture user input
function user_input {
        read -p "Enter username: " username
        read -p "Enter password: " password
}

# Function to handle retry mechanism
function try_again {
        lines
        echo "Would you like to try again y/n? "
        read option

        if [ "$option" == "y" ]
        then
                count=1
                while [ $count -le 3 ]
                do
                        user_input
                        validation_1
                        if [ "$username" == "root" ] && [ "$password" == "pass" ]
                        then
                                lines
                                echo "Login success"
                                break
                        else
                                lines
                                echo "Attempt failed --> $count"
                                echo "Invalid login credentials"
                                ((count++))
                                continue
                        fi

                done

        elif [ "$option" == "n" ]
        then
                lines
                echo "You choose to quit"
                echo "Exisitng the program"
        else
                lines
                echo "Invalid user input"
                echo "Exiting the program"
        fi
}

# Function to validate if username/password fields are empty
function validation_1 {
        if [ -z "$username" ] || [ -z "$password" ]
        then
                if [ -n "$username" ] && [ -z "$password" ]
                then
                        lines
                        echo "User input --> Password field is empty"
                elif [ -z "$username" ] && [ -n "$password" ]
                then
                        lines
                        echo "User input --> Username field is empty"
                elif [ -z "$username" ] && [ -z "$password" ]
                then
                        lines
                        echo "User input --> Username field is empty"
                        echo "User input --> Password field is empty"
                fi
        fi
}
# Function to validate credentials

function validation_2 {
        if [ -n "$username" ] && [ -n "$password" ]
        then
                if [ "$username" == "root" ] && [ "$password" == "pass" ]
                then
                        lines
                        echo "Login success !!!"
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
