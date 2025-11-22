#!/bin/bash
#   This script accepts two user-provided integers (no leading zeros allowed)
#   and performs basic arithmetic operations:
#       - Addition
#       - Subtraction
#       - Multiplication
#       - Exponent (Power)
#       - Division (Quotient)
#       - Modulus (Remainder)
#
#   The script validates:
#       1. Empty inputs
#       2. Invalid number formats using regex
#       3. Division by zero
#
#   If both inputs are valid integers, the script prints the results.

# Print a separator line for neat and readable output
function lines {
        echo "**********************************************************************"
}

# Function first_number_check, second_number_check
# Accept -- Positive or negative numbers
# Reject -- Numbers starting with zero or non numeric values such as alphabets

function first_number_check {
        [[ $first_number =~ ^-?[1-9][0-9]*$ ]]
}
function second_number_check {
        [[ $second_number =~ ^-?[1-9][0-9]*$ ]]
}

# Display warning about leading zeros
# Prompt user for input
lines
echo "Warning: Please do not provide input that starts with zero, eg:0,01,001"
read -p "Enter the first number: " first_number
read -p "Enter the second number: " second_number

###############################################################################
# EMPTY INPUT CHECK
###############################################################################
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


###############################################################################
# FORMAT VALIDATION USING REGEX
# Only integers without leading zeros are allowed.
# PERFORM ARITHMETIC OPERATIONS
###############################################################################
elif [ -n "$first_number" ] && [ -n "$second_number" ]
then
        if ! first_number_check || ! second_number_check
        then
                if first_number_check && ! second_number_check
                then
                        lines
                        echo "User input -- Second number field has an invalid input"
                elif ! first_number_check && second_number_check
                then
                        lines
                        echo "User input -- First number field has an invalid input"
                elif ! first_number_check && ! second_number_check
                then
                        lines
                        echo "User input -- First number field has an invalid input"
                        echo "User input -- Second number field has an invalid input"
                fi
        elif first_number_check && second_number_check
        then
                lines
                sum=$(($first_number+$second_number))
                subtract=$(($first_number-$second_number))
                multiply=$(($first_number*$second_number))
                power=$(($first_number**$second_number))
                quotient=$(($first_number/$second_number))
                remainder=$(($first_number%$second_number))

                echo "First number: $first_number plus Second number: $second_number -- $sum"
                echo "First number: $first_number subtract Second number: $second_number -- $subtract"
                echo "First number: $first_number multiply Second number: $second_number -- $multiply"
                echo "First number: $first_number power Second number: $second_number -- $power"
                echo "First number: $first_number divide (Quotient) Second number: $second_number -- $quotient"
                echo "First number: $first_number divide (Remainder) Second number: $second_number -- $remainder"

        fi
fi

