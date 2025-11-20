#!/bin/bash

##########################################################################

# Description:
# This script safely adds two user-provided integers and allows the user
# to continue adding additional numbers to the running total. It includes
# strict validation to prevent invalid inputs.
#
# Features:
#   • Accepts positive and negative integers (e.g., 10, -5, 0)
#   • Rejects numbers with leading zeros (e.g., 01, 001, 0005)
#   • Allows 0 as a valid number (but not 00, 000, etc.)
#   • Rejects non-numeric values (letters, decimals, symbols)
#   • Checks for empty input fields
#   • Continuously prompts the user to add new numbers to the sum
#   • Displays each calculation clearly
#
# Input Rules:
#   ✔ Valid: 10, -10, 0, 250, -999
#   ✘ Invalid: 01, 0005, abc, 5.5, --10, +20
#

# Print separator line
function lines {
        echo "***************************************************************"
}

# Detect numbers that start with a leading zero (01, 001, 0001)
# If user input starts with zero, display an error 
function first_number_leading_zero {
        [[ $first_number =~ ^0[0-9]+$ ]]
}
function second_number_leading_zero {
        [[ $second_number =~ ^0[0-9]+$ ]]
}
function new_number_leading_zero {
        [[ $new_number =~ ^0[0-9]+$ ]]
}

# Check if the input is a valid integer (positive or negative)
function first_number_check {
        [[ $first_number =~ ^-?[0-9]+$ ]]
}
function second_number_check {
        [[ $second_number =~ ^-?[0-9]+$ ]]
}
function new_number_check {
        [[ $new_number =~ ^-?[0-9]+$ ]]
}

############################################################################
# CONTINUE ADDING NUMBERS LOOP
# New number -- Reject leading zero, Reject non-numeric values
############################################################################
function try_again {
        lines
        read -p "Would you like to add a new number to the previous sum. y/n? " choice
        if [ "$choice" == "y" ]
        then
                lines
                read -p "Enter the new number: " new_number

                if new_number_leading_zero
                then
                        lines
                        echo "User input -- New number should not start with zero"
                        try_again
                elif ! new_number_leading_zero
                then
                        if ! new_number_check
                        then
                                lines
                                echo "User input -- New number must contain only numeric values"
                                try_again
                        elif new_number_check
                        then
                                result=$(($sum+$new_number))
                                echo "Previous result: $sum plus New number: $new_number -- $result"
                                sum=$result
                                try_again
                        fi
                fi
        elif [ "$choice" == "n" ]
        then
                lines
                echo "You choose to quit, bye"
                exit
        else
                lines
                echo "Invalid user input"
                try_again
        fi
}

############################################################################
# MAIN PROGRAM STARTS HERE
############################################################################
lines
echo "Warning -- Number should not start with zero eg. 01, 001, 0001"
sleep 0.5
lines

# Prompt for user input
read -p "Enter the first number: " first_number
read -p "Enter the second number: " second_number

# If user input is empty
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

############################################################################
# NUMERIC VALIDATION CHECK
# Check -- User input start with zero or non numeric value -- Display error
# If user input ok -- Do addition 
############################################################################
elif [ -n "$first_number" ] && [ -n "$second_number" ]
then
        if first_number_leading_zero || second_number_leading_zero
        then
                if ! first_number_leading_zero && second_number_leading_zero
                then
                        lines
                        echo "User input -- Second number should not start with zero"
                elif first_number_leading_zero && ! second_number_leading_zero
                then
                        lines
                        echo "User input -- First number should not start with zero"
                elif  first_number_leading_zero && second_number_leading_zero
                then
                        lines
                        echo "User input -- First number should not start with zero"
                        echo "User input -- Second number should not start with zero"
                fi
        elif ! first_number_leading_zero && ! second_number_leading_zero
        then
                if ! first_number_check || ! second_number_check
                then
                        if first_number_check && ! second_number_check
                        then
                                lines
                                echo "User input -- Second number must contain only numeric values"
                        elif ! first_number_check && second_number_check
                        then
                                lines
                                echo "User input -- First number must contain only numeric values"
                        elif ! first_number_check && ! second_number_check
                        then
                                lines
                                echo "User input -- First number must contain only numeric values"
                                echo "User input -- Second number must contain only numeric values"
                        fi
                elif first_number_check && second_number_check
                then
                        lines
                        sum=$(($first_number+$second_number))
                        echo "First number: $first_number plus Second number: $second_number -- $sum"
                        try_again

                fi
        fi
fi
