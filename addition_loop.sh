#!/bin/bash
# This script demonstrates input validation, arithmetic operations, and iterative addition using functions in Bash.
# This Bash script allows the user to enter two numbers and displays their sum.
# After showing the result, the script asks whether the user would like to continue.
# If the user chooses to continue, a new number is requested and added to the previous result.
# This process repeats, allowing the sum to grow iteratively, until the user decides to quit.

#!/bin/bash

# Function : Prints a line separator for better readability
function lines {
        echo "******************************************************************************"
}

# Functions i.e. first_number_check, second_number_check, new_number_echk
# Validates that the new number (used later) contains only digits or a minus sign.
function first_number_check {
        [[ $first_number =~ ^[0-9-]+$ ]]
}
function second_number_check {
        [[ $second_number =~ ^[0-9-]+$ ]]
}

function new_number_check {
        [[ $new_number =~ ^[0-9-]+$ ]]
}

# Prompts the user if they want to add another number to the current sum.
# If yes, validates the new input and updates the total.
# If no, exits the program gracefully.
function try_again {
        read -p "Would you like to add a new number to the previous sum y/n ?: " choice
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
                        if ! new_number_check
                        then
                                lines
                                echo "New number field must contain onny numeric values"
                                try_again
                        elif new_number_check
                        then
                                lines
                                result=$(($sum+$new_number))
                                echo "Previus result: $sum plus New number: $new_number --> $result"
                                sum=$result
                                try_again
                        fi
                fi
        else
                lines
                echo "Invalid user input"
                try_again
        fi

}

#User Input
read -p "Enter the first number: " first_number
read -p "Enter the second number: " second_number

# Check if any user input is empty
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

# User input not empty 
# Function first_number_check and second_number_check called -- Check the user input must contain only numeric values
elif [ -n "$first_number" ] && [ -n "$second_number" ]
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
                sum=$(($first_number+$second_number))
                echo "First number: $first_number plus Second number: $second_number --> $sum"
                try_again
        fi
fi
