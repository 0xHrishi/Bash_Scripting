#!/bin/bash
# Script -- Prompt for user input 
# Display even or odd numbers 

function lines {
        echo "*************************************************************"
}

# Function first_number_check, second_number_check -- Check user input
# User input must for numeric values only, can be negative numbers but should not start with zero
function first_number_check {
        [[ $first_number =~ ^[1-9-][0-9]*$ ]]
}
function second_number_check {
        [[ $second_number =~ ^[1-9-][0-9]*$ ]]
}

# User input
read -p "Enter the first number: " first_number
read -p "Enter the second number: " second_number

# If user input empty
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
        
# BOTH INPUTS ARE NON-EMPTY
# If BOTH numbers pass validation
# If user input valid -- Display odd or even numbers based upon the user preferrence

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
                        echo "First number: $first_number is greater than Second number: $second_number"
                elif [ $first_number -lt $second_number ]
                then
                        lines
                        read -p "Would you like to print ODD or EVEN numbers? " option

                        if [ "$option" == "EVEN" ]
                        then
                                for even_numbers in $(seq $first_number $second_number)
                                do
                                        if (($even_numbers%2==0))
                                        then
                                                lines
                                                echo "Even number --> $even_numbers"
                                                sleep 0.2
                                        else
                                                sleep 0.2
                                                continue
                                        fi

                                done
                        elif [ "$option" == "ODD" ]
                        then
                                for odd_numbers in $(seq $first_number $second_number)
                                do
                                        if (($odd_numbers%2!=0))
                                        then
                                                lines
                                                echo "Odd number --> $odd_numbers"
                                                sleep 0.2
                                        else
                                                sleep 0.2
                                                continue
                                        fi
                                done
                        else
                                lines
                                echo "Invalid user option"
                        fi

                fi
        fi
fi
