#!/bin/bash

# This Bash script accepts two numbers from the user, validates them,
# calculates their sum, and then allows the user to repeatedly add new numbers to the previous result.

# Prints a separator line for readability
function lines {
        echo "*************************************************************"
}

# Function -- first_number_check, second_number_check,new_number_check
# Only positive or negative number 
# First digit must be 1–9 (cannot be zero)
function first_number_check {
        [[ $first_number =~ ^[1-9-][0-9]*$ ]]
}
function second_number_check {
        [[ $second_number =~ ^[1-9-][0-9]*$ ]]
}
function new_number_check {
        [[ $new_number =~ ^[1-9-][0-9]*$ ]]
}

# -------------------------------------------------------------------
# Repeatedly asks user if they want to add a new number to existing sum
# Handles validation, empty values, and incorrect inputs.
# This function uses recursion for repeated attempts.
# -------------------------------------------------------------------
function try_again {
        lines
        read -p "Would you like to add a new number to the previous result y/n? " choice

        if [ "$choice" == "n" ]
        then
                lines
                echo "You choose to quit, bye"
        elif [ "$choice" == "y" ]
        then
                read -p "Enter the new number: " new_number
                if [ -z "$new_number" ]
                then
                        lines
                        echo "User input --> New number field is empty"
                        try_again
                elif [ -n "$new_number" ]
                then
                        if ! new_number_check
                        then
                                lines
                                echo "New number field must contain only numeric(postive or negative) values"
                                try_again
                        elif new_number_check
                        then
                                new_sum=$(($sum+$new_number))
                                echo "Previous sum: $sum plus New number: $new_number --> $new_sum"
                                sum=$new_sum
                                try_again
                        fi
                fi
        else
                lines
                echo "Invalid user input, try again"
                try_again
        fi
}

# -------------------------------------------------------------------
# MAIN SCRIPT EXECUTION
# -------------------------------------------------------------------
echo "Warning -- Please do not provide input that start with a zero i.e. 0,01,001 "
sleep 0.5
# User prompt
read -p "Enter the first number: " first_number
read -p "Enter the second number: " second_number

# User input empty
if [ -z "$first_number" ] || [ -z "$second_number" ]
then
        if [ -n "$first_number" ] && [ -z "$second_number" ]
        then
                lines
                echo "User input -- Second number field must is empty"
        elif [ -z "$first_number" ] && [ -n "$second_number" ]
        then
                lines
                echo "User input -- First number field must is empty"
        elif [ -z "$first_number" ] && [ -z "$second_number" ]
        then
                lines
                echo "User input -- First number field must is empty"
                echo "User input -- Second number field must is empty"
        fi
        
# Both inputs are not empty

elif [ -n "$first_number" ] && [ -n "$second_number" ]
then
        if ! first_number_check || ! second_number_check
        then
                if first_number_check && ! second_number_check
                then
                        lines
                        echo "Second number field must contain only numeric(postive or negative) values"
                elif ! first_number_check && second_number_check
                then
                        lines
                        echo "First number field must contain only numeric(postive or negative) values"
                elif ! first_number_check && ! second_number_check
                then
                        lines
                        echo "First number field must contain only numeric(postive or negative) values"
                        echo "Second number field must contain only numeric(postive or negative) values"
                fi

        elif first_number_check && second_number_check
        then
                lines
                sum=$(($first_number+$second_number))
                echo "First number: $first_number plus Second number: $second_number --> $sum"
                try_again
        fi

fi
