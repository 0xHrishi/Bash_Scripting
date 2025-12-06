#!/bin/bash

# Script --- Basic Arithmetic calculations using case statements
function lines {
        echo "*************************************************************"
}

# Function -- first_number_check, second_number_check
# Only positive or negative numbers are alllowed, no alphabets
function first_number_check {
        [[ $first_number =~ ^[1-9-][0-9]*$ ]]
}
function second_number_check {
        [[ $second_number =~ ^[1-9-][0-9]*$ ]]
}

# Text Foreground color -- Red
RED='\033[0;31m'
NF='\033[0m'

# Display warning i.e. do not enter numbers statrting with zero
echo -e "${RED}User input must not start with zero e.g. 0, 01, 001${NF}"
sleep 0.3

# Prompt user input
read -p "Enter the first number: " first_number
read -p "Enter the second number: " second_number


# User input empty
if [ -z "$first_number" ] || [ -z "$second_number" ]
then
        if [ -n "$first_number" ] && [ -z "$second_number" ]
        then
                lines
                echo "User input -- Second number field is empty"
        elif [ -z "$first_number" ] && [ -n "$second_number" ]
        then
                lines
                echo "User input -- First number field is empty"
        elif [ -z "$first_number" ] && [ -z "$second_number" ]
        then
                lines
                echo "User input -- First number field is empty"
                echo "User input -- Second number field is empty"
        fi

# user input not empty
# Check validation i.e. user input contain valid numeric values 
# Both user input valid -- Show menu using case statements for operations 
# Perform the arithmetic operation selected by user
elif [ -n "$first_number" ] && [ -n "$second_number" ]
then
        if ! first_number_check || ! second_number_check
        then
                if first_number_check && ! second_number_check
                then
                        lines
                        echo "Second number field must contain only numeric(positive or negative) numbers"
                elif ! first_number_check && second_number_check
                then
                        lines
                        echo "First number field must contain only numeric(positive or negative) numbers"
                elif ! first_number_check && ! second_number_check
                then
                        lines
                        echo "First number field must contain only numeric(positive or negative) numbers"
                        echo "Second number field must contain only numeric(positive or negative) numbers"
                fi
        elif first_number_check && second_number_check
        then
                lines
                echo "Press 1 -- Addition"
                echo "Press 2 -- Subtraction"
                echo "Press 3 -- Multiply"
                echo "Press 4 -- Power"
                echo "Press 5 -- Divide(Quotient)"
                echo "Press 6 -- Divide(Remainder)"
                read option
                lines

                case $option in
                        1)
                                sum=$(($first_number+$second_number))
                                echo "First number: $first_number plus Second number: $second_number --> $sum"
                                ;;
                        2)
                                subtract=$(($first_number-$second_number))
                                echo "First number: $first_number minus Second number: $second_number --> $subtract"
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
                                echo "First number: $first_number divide(Quotient) Second number: $second_number --> $quotient"
                                ;;
                        6)
                                remainder=$(($first_number%$second_number))
                                echo "First number: $first_number divide(Remainder) Second number: $second_number --> $remainder"
                                ;;
                esac

        fi
fi

