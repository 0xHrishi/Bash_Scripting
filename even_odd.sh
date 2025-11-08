#!/bin/bash

# This script accepts two numbers and prints either even or odd numbers between them (based on user choice). 

function lines {
        echo "******************************************************************************"
}

echo "Print even or odd numbers, First number must be greather than second number"
sleep 0.2

# Prompt user input
read -p "Enter the first number: " first_number
read -p "Enter the second number: " second_number

# Function to check user input is correct i.e. only numeric values
function first_number_check {
        [[ $first_number =~ ^[0-9-]+$ ]]
}
function second_number_check {
        [[ $second_number =~ ^[0-9-]+$ ]]
}

# If user input is empty
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

# If both inputs are non-empty, proceed with numeric validation
# Numeric Validation Passed — Proceed with Comparison
# Based upon user input, print odd or even numbers 

elif [ -n "$first_number" ] && [ -n "$second_number" ]
then
        if ! first_number_check || ! second_number_check
        then
                if first_number_check && ! second_number_check
                then
                        lines
                        echo "Second number field must contain only numeric values"
                elif ! first_number_check && second_number_check
                then
                        lines
                        echo "First number field must contain only numeric values"
                elif ! first_number_check && ! second_number_check
                then
                        lines
                        echo "First number field must contain only numeric values"
                        echo "Second number field must contain only numeric values"
                fi
        elif first_number_check && second_number_check
        then
                if [ $first_number -eq $second_number ]
                then
                        lines
                        echo "First number: $first_number is equal to Second number: $second_number"
                elif [ $first_number -gt $second_number ]
                then
                        lines
                        echo "First number: $first_number is greather than Second number: $second_number"
                elif [ $first_number -lt $second_number ]
                then
                        lines
                        echo "Would you like to print even or odd numbers?"
                        read option

                        if [ "$option" == "even" ]
                        then
                                for even_numbers in $(seq $first_number $second_number)
                                do
                                        if (($even_numbers%2==0))
                                        then
                                                lines
                                                echo "Even number --> $even_numbers"
                                                sleep 0.3
                                                continue
                                        else
                                                sleep 0.3
                                                continue
                                        fi
                                done
                        elif [ "$option" == "odd" ]
                        then
                                for odd_numbers in $(seq $first_number $second_number)
                                do
                                        if (($odd_numbers%2!=0))
                                        then
                                                lines
                                                echo "Odd number --> $odd_numbers"
                                                sleep 0.3
                                                continue
                                        else
                                                sleep 0.3
                                        fi
                                done
                        else
                                lines
                                echo "Invalid user input"
                        fi
                fi
        fi
fi
