#!/bin/bash

# Description: This script accepts two positive integers (no leading zeros, no decimals)
#              and allows the user to perform basic arithmetic operations:
#              Addition, Subtraction, Multiplication, Power, Quotient, and Remainder.

function lines {
        echo "***************************************************************"
}

# color codes for error
RED='\033[0;31m'
NF='\033[0m'

# Function to check the user input must contain only numeric values
function first_number_check {
        [[ $first_number =~ ^[1-9][0-9]*$ ]]
}
function second_number_check {
        [[ $second_number =~ ^[1-9][0-9]*$ ]]
}

# User input instructions
echo -e "${RED}Do not enter numbers leading with 0 or 0 or decimal values${NF}"
sleep 0.2
# user input
read -p "Enter the first number: " first_number
read -p "Enter the second number: " second_number

# user input empty
if [ -z "$first_number" ] || [ -z "$second_number" ]
then
        lines
        if [ -z "$first_number" ]
        then
                echo -e "${RED}User input --> First number field is empty"
        fi
        if [ -z "$second_number" ]
        then
                echo -e "${RED}User input --> Second number field is empty"
        fi
# user input not empty
# validation check
# validation passes --  If both numbers are valid, show menu
# Perform operation based on user choice
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
                echo "Press 1 for Addition"
                echo "Press 2 for Subtraction"
                echo "Press 3 for Multiplication"
                echo "Press 4 for Power"
                echo "Press 5 for Quotient"
                echo "Press 6 for Remainder"
                read choice
                lines
                case $choice in
                        1)
                                add=$(($first_number+$second_number))
                                echo "First number: $first_number plus Second number: $second_number --> $add"
                                ;;
                        2)
                                sub=$(($first_number-$second_number))
                                echo "First number: $first_number subtract Second number: $second_number --> $sub"
                                ;;
                        3)
                                multiply=$(($first_number*$second_number))
                                echo "First number: $first_number multiply Second number: $second_number --> $multiply"
                                ;;
                        4)
                                power=$(($first_number**$second_number))
                                echo "First number: $first_number power Second number: $second_number --> $power"
                                ;;
                        5)
                                quotient=$(($first_number/$second_number))
                                echo "First number: $first_number divide (Quotient) Second number: $second_number --> $quotient"
                                ;;
                        6)
                                remainder=$(($first_number%$second_number))
                                echo "First number: $first_number divide (Remainder) Second number: $second_number --> $remainder"
                                ;;
                        *)
                                echo -e "${RED}Invalid user input${NF}"
                esac
        fi
fi
