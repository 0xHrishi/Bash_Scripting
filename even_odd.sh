#!/bin/bash
# This script accepts two numbers from the user, validates them, compares 
# them, and if the first number is smaller than the second, it prints either 
# all even or all odd numbers in that range based on user choice.

# Function: Print separator line
function lines {
        echo "*************************************************************"
}


# Function: Validate first_number_check, second_number_check
# Allows: negative or positive integers, no leading zeros (except -)
function first_number_check {
        [[ $first_number =~ ^-?[1-9][0-9]*$ ]]
}
function second_number_check {
        [[ $second_number =~ ^-?[1-9][0-9]*$ ]]
}

# Take user input
read -p "Enter the first number: " first_number
read -p "Enter the second number: " second_number

# ===========================
# EMPTY INPUT VALIDATION
# ===========================
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


# =======================================================
# IF BOTH INPUTS PROVIDED, NOW PERFORM VALIDATION
# IF BOTH NUMBERS ARE VALID, PROCESS COMPARISON LOGIC
# PRINT EVEN OR ODD NUMBERS BASED UPON USER CHOICE
# =======================================================
elif [ -n "$first_number" ] && [ -n "$second_number" ]
then
        if ! first_number_check || ! second_number_check
        then
                if first_number_check && ! second_number_check
                then
                        lines
                        echo "User input -- Second number field invalid entry"
                elif ! first_number_check && second_number_check
                then
                        lines
                        echo "User input -- First number field invalid entry"
                elif ! first_number_check && ! second_number_check
                then
                        lines
                        echo "User input -- First number field invalid entry"
                        echo "User input -- Second number field invalid entry"
                fi
        elif first_number_check && second_number_check
        then
                if [ $first_number -eq $second_number ]
                then
                        lines
                        echo "First number: $first_number is equal to Second number: $second_number"
                        echo "Both numbers are equal, nothing can be done"
                elif [ $first_number -gt $second_number ]
                then
                        lines
                        echo "First number: $first_number is greater than Second number: $second_number"
                        echo "Nothing can be done"
                elif [ $first_number -lt $second_number ]
                then
                        lines
                        read -p "Would you like to print even or odd number: " choice
                        if [ "$choice" == "even" ]
                        then
                                for even_numbers in $(seq $first_number $second_number)
                                do
                                        if (($even_numbers%2==0))
                                        then
                                                echo "Even number -- $even_numbers"
                                                sleep 0.2
                                        else
                                                sleep 0.2
                                        fi

                                done
                        elif [ "$choice" == "odd" ]
                        then
                                for odd_numbers in $(seq $first_number $second_number)
                                do
                                        if (($odd_numbers%2!=0))
                                        then
                                                echo "Odd number -- $odd_numbers"
                                                sleep 0.2
                                        else
                                                sleep 0.2
                                        fi
                                done

                        else
                                lines
                                echo "Invalid user input"
                        fi
                fi
        fi
fi
