#!/bin/bash
#
# Title: Basic Arithmetic Operations in Bash
#   This script demonstrates basic arithmetic operations using Bash.

function lines {
        echo "*************************************************"
}

# Function to check if the first number is numeric
# Function to check if the second number is numeric
function first_number_right {
        [[ $first_number =~ ^[0-9]+$ ]]
}
function second_number_right {
        [[ $second_number =~ ^[0-9]+$ ]]
}

# Display title and initial instructions
echo "Arithmetic operations"
echo "Enter any number except 0"
sleep 1
lines
read -p "Enter the first number: " first_number
read -p "Enter the second number: " second_number

# Check if either input is empty
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
# If both inputs are non-empty, validate numeric values
# If both inputs are valid, perform arithmetic operations

elif [ -n "$first_number" ] && [ -n "$second_number" ]
then
        if ! first_number_right || ! second_number_right
        then
                if first_number_right && ! second_number_right
                then
                        lines
                        echo "Second number field must contain only numeric values"
                elif ! first_number_right && second_number_right
                then
                        lines
                        echo "First number field must contain only numeric values"
                elif ! first_number_right && ! second_number_right
                then
                        lines
                        echo "First number field must contain only numeric values"
                        echo "Second number field must contain only numeric values"
                fi
        elif first_number_right && second_number_right
        then
                lines
                add=$(($first_number+$second_number))
                subtract=$(($first_number-$second_number))
                multiply=$(($first_number*$second_number))
                power=$(($first_number**$second_number))
                quotient=$(($first_number/$second_number))
                remainder=$(($first_number%$second_number))
                echo "First number:$first_number plus Second number:$second_number --> $add"
                echo "First number:$first_number subtract Second number:$second_number --> $subtract"
                echo "First number:$first_number multiply Second number:$second_number --> $multiply"
                echo "First number:$first_number power Second number:$second_number --> $power"
                echo "First number:$first_number divide (quotient) Second number:$second_number --> $quotient"
                echo "First number:$first_number divide (remainder) Second number:$second_number --> $remainder"
        fi
fi

