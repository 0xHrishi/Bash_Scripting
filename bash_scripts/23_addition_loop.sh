#!/bin/bash

# =============================================================================
# Script Name : interactive_sum_calculator.sh
#
# Description :
#   This Bash script accepts two integers (positive or negative, non-zero,
#   no leading zeros, no decimals), validates the input, and calculates their sum.
#   The user is then repeatedly prompted to add additional numbers to the
#   previous result until they choose to stop.
# =============================================================================

function lines {
        echo "****************************************************************"
}

# color codes for error messages
RED='\033[0;31m'
NF='\033[0m'

# Function i.e. first_number_check, second_number_check, number_check
# To validate the user input
function first_number_check {
        [[ $first_number =~ ^-?[1-9][0-9]*$ ]]
}
function second_number_check {
        [[ $second_number =~ ^-?[1-9][0-9]*$ ]]
}
function number_check {
        [[ $number =~ ^-?[1-9][0-9]*$ ]]
}

# Function to continuously accept new numbers and add them to the total sum
function new_number {
        lines
        read -p "Would you like to enter a new number and add it to the previous result. y/n?: " choice
        if [ "$choice" == "n" ]
        then
                echo -e "${RED}You choose not to continue${NF}"
                echo -e "${RED}Final result: $sum${NF}"
                exit

        elif [ "$choice" == "y" ]
        then
                read -p "Enter the number: " number
                lines
                if [ -z "$number" ]
                then
                        echo -e "${RED}User input--> New number field is empty, try again${NF}"
                        new_number
                elif [ -n "$number" ]
                then
                        if ! number_check
                        then
                                echo -e "${RED}Number field must contain only positive or negative integers, try again${NF}"
                                new_number
                        elif number_check
                        then
                                new_sum=$(($sum+$number))
                                echo "Previous result: $sum plus New number: $number --> $new_sum"
                                sum=$new_sum
                                new_number
                        fi
                fi

        else
                echo -e "${RED}Invalid user input${NF}"
        fi

}

# Intructions
echo -e "${RED}Do not enter numbers starting with leading zero or decimal numbers${NF}"
# Prompt user input
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

# User input and validate
# Validation passes, calculate the sum 
elif [ -n "$first_number" ] && [ -n "$second_number" ]
then
        if ! first_number_check || ! second_number_check
        then
                lines
                if ! first_number_check
                then
                        echo -e "${RED}The first number field must contain only positive or negative integers${NF}"
                fi
                if ! second_number_check
                then
                        echo -e "${RED}The Second number field must contain only positive or negative integers${NF}"
                fi
        elif first_number_check && second_number_check
        then
                lines
                sum=$(($first_number+$second_number))
                echo "First number: $first_number plus Second number: $second_number --> $sum"
                new_number
        fi
fi
