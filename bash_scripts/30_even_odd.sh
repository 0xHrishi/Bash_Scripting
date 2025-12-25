#!/bin/bash
# Print even or odd numbers based upon the user input
function lines {
        echo "****************************************************************"
}

# color codes for error messages
red='\033[0;31m'
nf='\033[0m'

# function to check, user input must contain only numeric values i.e. postive or negative
function first_number_check {
        [[ $first_number =~ ^-?[1-9][0-9]*$ ]]
}
function second_number_check {
        [[ $second_number =~ ^-?[1-9][0-9]*$ ]]
}

# Warning
echo "User input -- should not start with leading 0 i.e. 0,01, 001"
echo "First number must be lesser than second number"
sleep 0.5
# Prompt user input
read -p "Enter the first number: " first_number
read -p "Enter the second number: " second_number

# User input empty 
if [ -z "$first_number" ] || [ -z "$second_number" ]
then
        lines
        if [ -z "$first_number" ]
        then
                echo -e "${red}User input --> First number field is empty${nf}"
        fi
        if [ -z "$second_number" ]
        then
                echo -e "${red}User input --> Second number field is empty${nf}"
        fi

# Inputs are not empty
# validation check
# validation passed, compare the input 
# Ask user choice i.e. print even or odd numbers 
elif [ -n "$first_number" ] && [ -n "$second_number" ]
then
        if ! first_number_check || ! second_number_check
        then
                lines
                if ! first_number_check
                then
                        echo -e "${red}First number field must contain numeric values${nf}"
                fi
                if ! second_number_check
                then
                        echo -e "${red}Second number field must contain numeric values${nf}"
                fi
        elif first_number_check && second_number_check
        then
                lines
                if [ $first_number -eq $second_number ]
                then
                        echo -e "${red}First number: $first_number is equal to Second number: $second_number${nf}"
                elif [ $first_number -gt $second_number ]
                then
                        echo -e "${red}First number: $first_number is greater than Second number: $second_number${nf}"
                elif [ $first_number -lt $second_number ]
                then
                        read -p "Print even or odd number: " choice
                        if [ "$choice" == "even" ]
                        then
                                lines
                                for even_numbers in $(seq $first_number $second_number)
                                do
                                        if (($even_numbers%2==0))
                                        then
                                                echo "Even number --> $even_numbers"
                                                sleep 0.2
                                        else
                                                sleep 0.2
                                                continue
                                        fi
                                done
                        elif [ "$choice" == "odd" ]
                        then
                                lines
                                for odd_numbers in $(seq $first_number $second_number)
                                do
                                        if (($odd_numbers%2!=0))
                                        then
                                                echo "Odd number --> $odd_numbers"
                                                sleep 0.2
                                        else
                                                sleep 0.2
                                                continue
                                        fi
                                done
                        else
                                echo -e "${red}Invalid user input${nf}"
                        fi
                fi
        fi
fi
