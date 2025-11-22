#!/bin/bash

##########################################################################

# Description:
# This script safely adds two user-provided integers and allows the user
# to continue adding additional numbers to the running total. It includes
# strict validation to prevent invalid inputs.
#
# Features:
#   • Accepts two numbers from the user
#   • Numbers must NOT start with zero (0, -0, 01, 001 are invalid)
#   • nly valid integers such as 10, -10, 25, -99 are allowed
#   • Rejects non-numeric values (letters, decimals, symbols)
#   • Checks for empty input fields
#   • Continuously prompts the user to add new numbers to the sum
#   • Displays each calculation clearly
#
# Input Rules:
#   ✔ Valid: 10, -10, 0, 250, -999
#   ✘ Invalid: 01, 0005, abc, 5.5, --10, +20

#!/bin/bash

# Print a separator line for cleaner output formatting
function lines {
        echo "**********************************************************************"
}

# Function -- first_number,check, second_number_check, ew_number_check
# User input must contain only numeric values
function first_number_check {
        [[ $first_number =~ ^-?[1-9][0-9]*$ ]]
}
function second_number_check {
        [[ $second_number =~ ^-?[1-9][0-9]*$ ]]
}
function new_number_check {
        [[ $new_number =~ ^-?[1-9][0-9]*$ ]]
}

# ----------------------------------------------------------------------------
# Function: try_again
# Purpose : Ask the user if they want to add more numbers to the sum
# Logic   :
#   - If user chooses "y", prompt for a new validated number
#   - If user chooses "n", quit
#   - If invalid choice, ask again
# Note    : This uses recursion to repeat the process
# ----------------------------------------------------------------------------

function try_again {
        lines
        echo "Would you like to add a new number to the previous result, y/n ?"
        read choice

        if [ "$choice" == "n" ]
        then
                lines
                echo "You choose to quit"
                exit
        elif [ "$choice" == "y" ]
        then
                lines
                read -p "Enter the new number: " new_number
                if [ -z "$new_number" ]
                then
                        lines
                        echo "User input --> New number field is empty, try again"
                        try_again
                elif [ -n "$new_number" ]
                then
                        if new_number_check
                        then
                                result=$(($sum+$new_number))
                                echo "Previous result: $sum plus New number: $new_number --> $result"
                                sum=$result
                                try_again
                        elif ! new_number_check
                        then
                                lines
                                echo "User input -- New number field has an invalid input, try again"
                                try_again
                        fi
                fi
        else
                lines
                echo "Invalid user input, try again"
                try_again
        fi
}

# ============================================================================
# Main Script Execution Starts Here
# ============================================================================
lines
echo "Warning : Please do not provide input that starts with with a zero, e.g.,0,01,001"
lines
sleep 0.5

read -p "Enter the first number: " first_number
read -p "Enter the second number: " second_number

# ----------------------------------------------------------------------------
# Handle empty input cases for first and/or second numbers
# ----------------------------------------------------------------------------
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
        
# ----------------------------------------------------------------------------
# User input not empty
# Validate both inputs
# Both inputs are valid → Perform the addition
# ----------------------------------------------------------------------------
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
                echo "First number: $first_number plus Second number: $second_number --> $sum"
                try_again
        fi
fi


