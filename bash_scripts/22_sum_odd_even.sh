#!/bin/bash

# Description --> User enters two numbers, add those numbers and calculate whether the sum is odd or even number.

# function
function lines {
        echo "************************************************"
}

# color code for error
RED='\033[1;31m'
NF='\033[0m'

# Function to check user input i.e. it must accept postive or negative integer values
function first_number_check {
        [[ $first_number =~ ^-?[1-9][0-9]*$ ]]
}
function second_number_check {
        [[ $second_number =~ ^-?[1-9][0-9]*$ ]]
}

# Warning 
echo -e "${RED}Do not enter number starting with zero such as 01, 001 and zero${NF}"
sleep 0.5
# User input
read -p "Enter the first number: " first_number
read -p "Enter the second number: " second_number

# If user input is empty
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
# validate the user input
# validation passed --> add the two numbers and display whether the sum is an odd or even integer
elif [ -n "$first_number" ] && [ -n "$second_number" ]
then
        lines
        if ! first_number_check || ! second_number_check
        then
                if ! first_number_check
                then
                        echo -e "${RED}First number field must contain only numeric values (positive and negative)"
                fi
                if ! second_number_check
                then
                        echo -e "${RED}Second number field must contain only numeric values (positive and negative)"
                fi
        elif first_number_check && second_number_check
        then
                sum=$(($first_number+$second_number))
                echo "First number: $first_number plus Second number: $second_number --> $sum"
                if (($sum%2==0))
                then
                        echo "Sum: $sum is an even number"
                else
                        echo "Sum: $sum is an odd number"
                fi
        fi
fi
