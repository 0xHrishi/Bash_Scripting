#!/bin/bash
#Very basic script to display arithmetic operators 
#Basic such as for addition, subtraction, multiplication, power, divide for quotient and remainder

#function to display lines
function lines {
        echo "*************************************************"
}

#User input i.e. first_number and second_number
read -p "Enter the first number: " first_number
read -p "Enter the second number: " second_number

#function to check first and second_number contain only numeric values
#If not, display error
function first_number_right {
        [[ $first_number =~ ^[0-9-]+$ ]]
}
function first_number_wrong {
        [[ ! $first_number =~ ^[0-9-]+$ ]]
}
function second_number_right {
        [[ $second_number =~ ^[0-9-]+$ ]]
}
function second_number_wrong {
        [[ ! $second_number =~ ^[0-9-]+$ ]]
}

#User input empty 
if [ -z "$first_number" ] || [ -z "$second_number" ]
then
        if [ -z "$first_number" ] && [ -n "$second_number" ]
        then
                lines
                echo "User input --> First number field is empty"
        elif [ -n "$first_number" ] && [ -z "$second_number" ]
        then
                lines
                echo "User input --> Second number field is empty"
        elif [ -z "$first_number" ] && [ -z "$second_number" ]
        then
                lines
                echo "User input --> First number field is empty"
                echo "User input --> Second number field is empty"
        fi
#User input is not empty
#Also check, the user input must contain only numeric values
#If contain only numeric values, than do arithmetic operations such as addition, subtraction, multiplication, power, divide for quotient and remainder
elif [ -n "$first_number" ] && [ -n "$second_number" ]
then
        if first_number_wrong || second_number_wrong
        then
                if first_number_right && second_number_wrong
                then
                        lines
                        echo "User input --> Second number field must contain only numeric values"
                elif first_number_wrong && second_number_right
                then
                        lines
                        echo "User input --> First number field must contain only numeric values"
                elif first_number_wrong && second_number_wrong
                then
                        lines
                        echo "User input --> First number field must contain only numeric values"
                        echo "User input --> Second number field must contain only numeric values"
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
                echo "First number:$first_number divide (Quotient) Second number:$second_number --> $quotient"
                echo "First number:$first_number divide (Remainder) Second number:$second_number --> $remainder"

        fi
fi
