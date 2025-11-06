#!/bin/bash

# Arithmetic operators using case statements 

function lines {
        echo "******************************************************************************"
}

# User prompt 
read -p "Enter the first number: " first_number
read -p "Enter the second number: " second_number

# Function to check, the user input must contain only numeric values

function first_number_check {
        [[ $first_number =~ ^[0-9-]+$ ]]
}
function second_number_check {
        [[ $second_number =~ ^[0-9-]+$ ]]
}

# If user input empty
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
# If both inputs are provided, validate numeric format
# Perform selected arithmetic operation using Bash arithmetic expansion using case statements

elif [ -n "$first_number" ] && [ -n "$second_number" ]
then
        if ! first_number_check || ! second_number_check
        then
                if first_number_check && ! second_number_check
                then
                        lines
                        echo "Second number field must contain numeric values"
                elif ! first_number_check && second_number_check
                then
                        lines
                        echo "First number field must contain numeric values"
                elif ! first_number_check && ! second_number_check
                then
                        lines
                        echo "First number field must contain numeric values"
                        echo "Second number field must contain numeric values"
                fi
        elif first_number_check && second_number_check
        then
                lines
                echo "Press 1 --> Addition"
                echo "Press 2 --> Subtraction"
                echo "Press 3 --> Multiplication"
                echo "Press 4 --> Power"
                echo "Press 5 --> Divide (Quotient)"
                echo "Press 6 --> Divide (Remainder)"
                read option
                lines

                case $option in
                        1)
                                sum=$((10#$first_number+10#$second_number))
                                echo "First number: $first_number plus Second number: $second_number --> $sum"
                                ;;
                        2)
                                subtract=$((10#$first_number-10#$second_number))
                                echo "First number: $first_number minus Second number: $second_number --> $subtract"
                                ;;
                        3)
                                multiply=$((10#$first_number*10#$second_number))
                                echo "First number: $first_number multiply Second number: $second_number --> $multiply"
                                ;;
                        4)
                                power=$((10#$first_number**10#$second_number))
                                echo "First number: $first_number power Second number: $second_number --> $power"
                                ;;
                        5)
                                quotient=$((10#$first_number/10#$second_number))
                                echo "First number: $first_number divide (Quotient) Second number: $second_number --> $quotient"
                                ;;
                        6)
                                remainder=$((10#$first_number%10#$second_number))
                                echo "First number: $first_number divide (Remainder) Second number: $second_number --> $remainder"
                                ;;
                esac
        fi
fi
