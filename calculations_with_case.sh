#!/bin/bash
###############################################################################
# This script performs basic arithmetic operations (addition, subtraction,
# multiplication, power, quotient, and remainder) on two user-provided
# numbers.
# Once both inputs are validated, the script displays a menu and performs
# the selected operation
###############################################################################

# Function to print a separator line
function lines {
        echo "*************************************************************"
}

# Function -- first_number_check, second_number_check
# Make sure it allows positive or negative numbers, numbers should not start with 0
# No alphabets, only numeric 
function first_number_check {
        [[ $first_number =~ ^-?[1-9][0-9]*$ ]]
}
function second_number_check {
        [[ $second_number =~ ^-?[1-9][0-9]*$ ]]
}

# User input
echo "Warning: Please do not provide input that starts with zero, eg:0,01,001"
read -p "Enter the first number: " first_number
read -p "Enter the second number: " second_number


# If user input is empty
if [ -z "$first_number" ] || [ -z "$second_number" ]
then
        if [ -n "$first_number" ] && [ -z "$second_number" ]
        then
                lines
                echo "User input -- First number field is empty"
        elif [ -z "$first_number" ] && [ -n "$second_number" ]
        then
                lines
                echo "User input -- Second number field is empty"
        elif [ -z "$first_number" ] && [ -z "$second_number" ]
        then
                lines
                echo "User input -- First number field is empty"
                echo "User input -- Second number field is empty"
        fi

# Both inputs are non-empty — validate numeric format
# Both inputs valid — show menu and perform calculation
elif [ -n "$first_number" ] && [ -n "$second_number" ]
then
        if ! first_number_check || ! second_number_check
        then
                if first_number_check && ! second_number_check
                then
                        lines
                        echo "Second number field -- Invalid entry"
                elif ! first_number_check && second_number_check
                then
                        lines
                        echo "First number field -- Invalid entry"
                elif ! first_number_check && ! second_number_check
                then
                        lines
                        echo "First number field -- Invalid entry"
                        echo "Second number field -- Invalid entry"
                fi
        elif first_number_check && second_number_check
        then
                liness
                echo "Enter 1 -- Addition"
                echo "Enter 2 -- Subtraction"
                echo "Enter 3 -- Multiply"
                echo "Enter 4 -- Power"
                echo "Enter 5 -- Quotient"
                echo "Enter 6 -- Remainder"
                read choice

                case $choice in
                        1)
                                lines
                                sum=$(($first_number+$second_number))
                                echo "First number: $first_number plus Second number: $second_number -- $sum"
                                ;;
                        2)
                                lines
                                subtract=$(($first_number-$second_number))
                                echo "First number: $first_number minus Second number: $second_number -- $subtract"
                                ;;
                        3)
                                lines
                                multiply=$(($first_number*$second_number))
                                echo "First number: $first_number multiply Second number: $second_number -- $multiply"
                                ;;
                        4)
                                lines
                                power=$(($first_number**$second_number))
                                echo "First number: $first_number power Second number: $second_number -- $power"
                                ;;
                        5)
                                lines
                                quotient=$(($first_number/$second_number))
                                echo "First number: $first_number divide (quotient) Second number: $second_number -- $quotient"
                                ;;
                        6)
                                lines
                                remainder=$(($first_number%$second_number))
                                echo "First number: $first_number divide (remainder) Second number: $second_number -- $remainder"
                                ;;
                        *)
                                lines
                                echo "Invalid user input"
                                ;;
                esac
        fi
fi
