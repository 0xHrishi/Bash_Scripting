#!/bin/bash
#
# Title: Basic Arithmetic Operations in Bash
# This script demonstrates basic arithmetic operations using Bash.
# This interactive Bash script prompts the user for two numbers,
# validates the input for emptiness and non-numeric characters,
# and performs multiple arithmetic operations:

# Function :  Prints a line separator for better readability.
function lines {
        echo "******************************************************************************"
}

# Function to prompt for user input
function user_input {
        read -p "Enter the first number: " first_number
        read -p "Enter the second number: " second_number
}

# Function to check that the user input must be only numeric values
function first_number_check {
        [[ $first_number =~ ^[0-9-]+$ ]]
}
function second_number_check {
        [[ $second_number =~ ^[0-9-]+$ ]]
}

# Checks for empty input fields and displays appropriate messages.
function validation_1 {
        if [ -z "$first_number" ] || [ -z "$second_number" ]
        then
                if [ -n "$first_number" ] && [ -z "$second_number" ]
                then
                        lines
                        echo "User input --> Second number field is empty"
                elif [ -z "$first_number" ] && [ -n "$second_number" ]
                then
                        lines
                        echo "User input --> First number field is empty"
                elif [ -z "$first_number" ] && [ -z "$second_number" ]
                then
                        lines
                        echo "User input --> First number field is empty"
                        echo "User input --> Second number field is empty"
                fi
        fi
}

# User input not empty
# Validates that both inputs are numeric.
# If valid, performs six arithmetic operations i.e add, subtract, multiply, power, quotient, remainder and prints the results.
# Uses '10#' prefix to ensure base-10 interpretation (avoids octal issue).

function validation_2 {
        if [ -n "$first_number" ] && [ -n "$second_number" ]
        then
                if ! first_number_check || ! second_number_check
                then
                        if first_number_check && ! second_number_check
                        then
                                lines
                                echo "User input --> Second number field must contain only numeric values"
                        elif ! first_number_check && second_number_check
                        then
                                lines
                                echo "User input --> First number field must contain only numeric values"
                        elif ! first_number_check && ! second_number_check
                        then
                                lines
                                echo "User input --> First number field must contain only numeric values"
                                echo "User input --> Second number field must contain only numeric values"
                        fi
                elif first_number_check && second_number_check
                then
                        lines
                        add=$((10#$first_number+10#$second_number))
                        sub=$((10#$first_number-10#$second_number))
                        multiply=$((10#$first_number*10#$second_number))
                        power=$((10#$first_number**10#$second_number))
                        quotient=$((10#$first_number/10#$second_number))
                        remainder=$((10#$first_number%10#$second_number))
                        echo "First number: $first_number plus Second number: $second_number --> $add"
                        echo "First number: $first_number minus Second number: $second_number --> $sub"
                        echo "First number: $first_number multiply Second number: $second_number --> $multiply"
                        echo "First number: $first_number power Second number: $second_number --> $power"
                        echo "First number: $first_number divide (Quotient) Second number: $second_number --> $quotient"
                        echo "First number: $first_number divide (Remainder) Second number: $second_number --> $remainder"
                fi
        fi
}

user_input
validation_1
validation_2

