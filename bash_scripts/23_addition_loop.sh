#!/bin/bash
# Description : Accepts two integer inputs from the user, Calculates the sum of the first two numbers
# Allows the user to continuously add new numbers to the previous result
# User can choose to continue or exit at any time


function lines {
        echo "*******************************************************"
}

# color codes for error 
RED='\033[1;31m'
NF='\033[0m'

# function to check user input i.e. integer values only 
function first_number_check {
        [[ $first_number =~ ^-?[1-9][0-9]*$ ]]
}
function second_number_check {
        [[ $second_number =~ ^-?[1-9][0-9]*$ ]]
}
function new_number_check {
        [[ $new_number =~ ^-?[1-9][0-9]*$ ]]
}

# Function that allows the user to keep adding numbers
# A new number must contain only integer value
# Add the new number to the previous result 
# This keep on going, until user choose to quit
function try_again {
        read -p "Would you like to add a new number to the previous result y/n ?: " choice

        lines
        if [ "$choice" == "n" ]
        then
                echo -e "${RED}You choose to quit, bye for now${NF}"
                exit
        elif [ "$choice" == "y" ]
        then
                read -p "Enter a new number: " new_number
                if [ -z "$new_number" ]
                then
                        echo -e "${RED}User input --> New number field is empty, try again${NF}"
                        try_again
                else
                        if ! new_number_check
                        then
                                echo -e "${RED}New number field must contain only numeric values, try again${NF}"
                                try_again
                        fi
                        if new_number_check
                        then
                                result=$(($sum+$new_number))
                                echo "Previous result: $sum plus New number: $new_number --> $result"
                                sum=$result
                                try_again
                        fi
                fi
        else
                echo -e "${RED}Invalid user input, try again by entering valid input${NF}"
                try_again
        fi
}

# Initial user warning
echo -e "${RED}Do not enter numbers starting with zero and zero${NF}"
sleep 0.5

# user input
read -p "Enter the first number: " first_number
read -p "Enter the second number: " second_number

# user input empty
if [ -z "$first_number" ] || [ -z "$second_number" ]
then
        lines
        if [ -z "$first_number" ]
        then
                echo -e "${RED}User input --> First number field is empty${NF}"
        fi
        if [ -z "$second_number" ]
        then
                echo -e "${RED}User input --> Second number field is empty${NF}"
        fi

# user input is not empty
# validate user input i.e. check it contain only integer values
# add the numbers, display the sum and call the try_again function
elif [ -n "$first_number" ] && [ -n "$second_number" ]
then
        if ! first_number_check || ! second_number_check
        then
                lines
                if ! first_number_check
                then
                        echo -e "${RED}First number field must contain only numeric values${NF}"
                fi
                if ! second_number_check
                then
                        echo -e "${RED}Second number field must contain only numeric values${NF}"
                fi
        elif first_number_check && second_number_check
        then
                lines
                sum=$(($first_number+$second_number))
                echo "First number: $first_number plus Second number: $second_number --> $sum"
                try_again
        fi
fi
