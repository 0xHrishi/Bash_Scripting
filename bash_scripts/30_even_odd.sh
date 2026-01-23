#!/bin/bash
# Description : 
#   - Takes two numbers from the user
#   - Validates empty and non-numeric input
#   - Compares the two numbers
#   - If first number is less than second number,
#     prints even or odd numbers between them based on user choice

function lines {
        echo "***************************************************************"
}

# color codes for error messages
RED='\033[0;31m'
NF='\033[0m'

# function to validate the user input
# Allows positive and negative integers (excluding 0)
function first_number_check {
        [[ $first_number =~ ^-?[1-9][0-9]*$ ]]
}
function second_number_check {
        [[ $second_number =~ ^-?[1-9][0-9]*$ ]]
}

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

# user input not empty
# Check for numeric validation
# If both numbers are valid integers -- compare
# Ask user choice for even or odd numbers
elif [ -n "$first_number" ] && [ -n "$second_number" ]
then
        if ! first_number_check || ! second_number_check
        then
                if ! first_number_check
                then
                        echo -e "${RED}First number field must contain numeric values${NF}"
                fi
                if ! second_number_check
                then
                        echo -e "${RED}Second number field must contain numeric values${NF}"
                fi

        elif first_number_check && second_number_check
        then
                lines
                if [ $first_number -eq $second_number ]
                then
                        echo -e "${RED}First number: $first_number is equal to Second number: $second_number${NF}"
                elif [ $first_number -ge $second_number ]
                then
                        echo -e "${RED}First number: $first_number is greater than Second number: $second_number${NF}"
                elif [ $first_number -lt $second_number ]
                then
                        read -p "Would you like to print even or odd number: even or odd? " choice

                        if [ "$choice" == "even" ]
                        then
                                for even_numbers in $(seq $first_number $second_number)
                                do
                                        if (($even_numbers%2==0))
                                        then
                                                echo "Even number is --> $even_numbers"
                                                lines
                                                sleep 0.2
                                        fi
                                done
                        elif [ "$choice" == "odd" ]
                        then
                                for odd_numbers in $(seq $first_number $second_number)
                                do
                                        if (($odd_numbers%2!=0))
                                        then
                                                echo "Odd number is --> $odd_numbers"
                                                lines
                                                sleep 0.2
                                        fi
                                done
                        else
                                echo -e "${RED}Invalid user input${NF}"
                        fi
                fi
        fi
fi
