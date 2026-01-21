#!/bin/bash
# -----------------------------------------------------------------------------
# Script Name: sum_even_odd_checker.sh
# Description: 
#   This Bash script prompts the user to enter two integers (positive or negative, 
#   non-zero, no decimals, no leading zeros). It validates the input and calculates 
#   the sum. The script then determines whether the sum is even or odd.
#-----------------------------------------------------------------------------

function lines {
        echo "****************************************************************"
}

# Color codes for error messages
RED='\033[0;31m'
NF='\033[0m'

# Function i.e. first_number_check and second_number_check to validate the user input
function first_number_check {
        [[ $first_number =~ ^-?[1-9][0-9]*$ ]]
}
function second_number_check {
        [[ $second_number =~ ^-?[1-9][0-9]*$ ]]
}

# User instructions
echo -e "${NF}Do not enter numbers starting with zero or Decimal numbers${NF}"
sleep 0.2

# User input
read -p "Enter the first number: " first_number
read -p "Enter the second number: " second_number

# If any user input is empty
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

# User input not empty
# Validate the user input
# Validation passes -- calculate the sum
# If both numbers are valid, perform sum and check even/odd
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
                        echo -e "${RED}The second number field must contain only positive or negative integers${NF}"
                fi
        elif first_number_check && second_number_check
        then
                sum=$(($first_number+$second_number))
                lines
                echo "First number: $first_number plus Second number: $second_number --> $sum"
                if (($sum%2==0))
                then
                        echo "Sum: $sum is Even number"
                elif (($sum%2!=0))
                then
                        echo "Sum: $sum is Odd number"
                fi

        fi
fi
