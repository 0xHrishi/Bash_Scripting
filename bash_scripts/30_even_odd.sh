#!/bin/bash

# Description : Accepts two integer inputs from the user.
# Prints even or odd numbers in the given range
function lines {
        echo "*****************************************"
}

# color codes for error messages
RED='\033[1;31m'
NF='\033[0m'

# function to validate user input
function first_number_check {
        [[ $first_number =~ ^-?[1-9][0-9]*$ ]]
}
function second_number_check {
        [[ $second_number =~ ^-?[1-9][0-9]*$ ]]
}

# warning
echo -e "${RED}Do not enter numbers starting with zero or zero${NF}"
echo -e "${RED}First number must be smaller than second number${NF}"
sleep 0.3
# prompt user input
read -p "Enter the first number: " first_number
read -p "Enter the second number: " second_number

# user input field empty
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
# validation check i.e. user input must be only integer values
# based upon the user preferrence, display odd or even numbers
else
        if ! first_number_check || ! second_number_check
        then
                lines
                if ! first_number_check
                then
                        echo -e "${RED}First number field must contain only integer values${NF}"
                fi
                if ! second_number_check
                then
                        echo -e "${RED}Second number field must contain only integer values${NF}"
                fi
        else
                if [ $first_number -eq $second_number ]
                then
                        lines
                        echo -e "${RED}First number: $first_number and second number: $second_number${NF}"
                        echo -e "${RED}Both are equal, nothing can be done${NF}"
                elif [ $first_number -gt $second_number ]
                then
                        lines
                        echo -e "${RED}First number: $first_number and second number: $second_number${NF}"
                        echo -e "${RED}$first_number > $second_number, nothing can be done${NF}"
                else
                        lines
                        read -p "Print even or odd numbers ? even or odd: " choice

                        lines
                        if [ "$choice" == "even" ]
                        then
                                for even_numbers in $(seq $first_number $second_number)
                                do
                                        if (($even_numbers%2==0))
                                        then
                                                echo "Even number --> $even_numbers"
                                                sleep 0.2
                                        fi
                                done
                        elif [ "$choice" == "odd" ]
                        then
                                for odd_numbers in $(seq $first_number $second_number)
                                do
                                        if (($odd_numbers%2!=0))
                                        then
                                                echo "Odd number --> $odd_numbers"
                                                sleep 0.2
                                        fi
                                done
                        else
                                echo -e "${RED}Invalid user option,bye${NF}"
                        fi

                fi
        fi
fi
