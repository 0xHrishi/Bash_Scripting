#!/bin/bash
#This script demonstrates input validation, arithmetic operations, and iterative addition using functions in Bash.
# This Bash script allows the user to enter two numbers and displays their sum.
# After showing the result, the script asks whether the user would like to continue.
# If the user chooses to continue, a new number is requested and added to the previous result.
# This process repeats, allowing the sum to grow iteratively, until the user decides to quit.

function lines {
        echo "*************************************************"
}

# Function to check if the user input contains only numeric values
function first_number_right {
        [[ $first_number =~ ^[0-9-]+$ ]]
}
function second_number_right {
        [[ $second_number =~ ^[0-9-]+$ ]]
}

function new_number_right {
        [[ $new_number =~ ^[0-9-]+$ ]]
}

# Function to handle adding a new number to the previous result if the user chooses to continue
function try_again {
        read -p "Would you like to add a new number with the previous result y/n ?: " option
        if [ "$option" == "n" ]
        then
                lines
                echo "You choose to quit"
                echo "Exiting the program"
                exit
        elif [ "$option" == "y" ]
        then
                read -p "Enter a new number to add: " new_number
                if ! new_number_right
                then
                        echo "New number must contain only numeric values"
                        lines
                        try_again
                elif new_number_right
                then
                        while true
                        do
                                lines
                                result=$(($sum+$new_number))
                                echo "Previous result:$sum plus New number:$new_number --> $result"
                                sum=$result
                                try_again
                        done
                fi
        else
                lines
                echo "Invalid user input"
                echo "Exiting the program"
                exit
        fi
}

# Prompt user for the first and second numbers
read -p "Enter a first number: " first_number
read -p "Enter a second number: " second_number

# Check if the user input is empty
if [ -z "$first_number" ] || [ -z "$second_number" ]
then
        if [ -n "$first_number" ] && [ -z "$second_number" ]
        then
                lines
                echo "User input --> Second number field is empty"
        elif [ -z "$first_number" ] && [ -n "$second_number" ]
        then
                lines
                echo "User input --> First number field is empty"
        elif [ -z "$first_number" ] && [ -z "$second_number" ]
        then
                lines
                echo "User input --> First number field is empty"
                echo "User input --> Second number field is empty"
        fi

# User input is not empty
# Check whether the input contains only numeric values

elif [ -n "$first_number" ] && [ -n "$second_number" ]
then
        if ! first_number_right || ! second_number_right
        then
                if first_number_right && ! second_number_right
                then
                        lines
                        echo "Second number field must contain only numeric values"
                elif ! first_number_right && second_number_right
                then
                        lines
                        echo "First number field must contain only numeric values"
                elif ! first_number_right && ! second_number_right
                then
                        lines
                        echo "First number field must contain only numeric values"
                        echo "Second number field must contain only numeric values"
                fi
        elif first_number_right && second_number_right
        then
                lines
                sum=$(($first_number+$second_number))
                echo "First number:$first_number plus Second number:$second_number --> $sum"
                lines
                try_again
        fi
fi
