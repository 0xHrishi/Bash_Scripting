#!/bin/bash
# Arithmetic operators with case statements 
function lines {
        echo "****************************************************************"
}

# color codes for error
red='\033[0;31m'
nf='\033[0m'

# Function to make sure, the user input contain only numeric values
function first_number_check {
        [[ $first_number =~ ^[1-9-][0-9]*$ ]]
}
function second_number_check {
        [[ $second_number =~ ^[1-9-][0-9]*$ ]]
}

# Prompt user, not to provide input with leading 0
echo "*****User input must not start with zero i.e. 0, 01, 001"
sleep 0.2
# User input
read -p "Enter the first number: " first_number
read -p "Enter the second number: " second_number

# User input empty
if [ -z "$first_number" ] || [ -z "$second_number" ]
then
        lines
        if [ -z "$first_number" ]
        then
                echo -e "${red}User input --> First number field is empty${nf}"
        fi
        if [ -z "$second_number" ]
        then
                echo -e "${red}User input --> Second number field is empty${nf}"
        fi

# user input not empty
# Validation check -- Make sure the user input contain only numeric values
# Validation pass -- arithmetic operators with case statements
elif [ -n "$first_number" ] && [ -n "$second_number" ]
then
        if ! first_number_check || ! second_number_check
        then
                lines
                if ! first_number_check
                then
                        echo -e "${red}First number field must contain numeric values i.e. positive or negative${nf}"
                fi
                if ! second_number_check
                then
                        echo -e "${red}Second number field must contain numeric values i.e. positive or negative${nf}"
                fi
        elif first_number_check && second_number_check
        then
                lines
                echo "Press 1 -- Addition"
                echo "Press 2-- Subtraction"
                echo "Press 3 -- Multiply"
                echo "Press 4 -- Power"
                echo "Press 5 -- Quotient"
                echo "Press 6 -- Remainder"
                read option

                lines
                case $option in
                        1)
                                sum=$(($first_number+$second_number))
                                echo "First number: $first_number plus Second number: $second_number --> $sum"
                                ;;
                        2)
                                subtract=$(($first_number-$second_number))
                                echo "First number: $first_number minus Second number: $second_number --> $subtract"
                                ;;
                        3)
                                multiply=$(($first_number*second_number))
                                echo "First number: $first_number multiply Second number: $second_number --> $multiply"
                                ;;
                        4)
                                power=$(($first_number**$second_number))
                                echo "First number: $first_number power Second number: $second_number --> $power"
                                ;;
                        5)
                                quotient=$(($first_number/$second_number))
                                echo "First number: $first_number divide (Quotient) Second number: $second_number --> $quotient"
                                ;;
                        6)
                                remainder=$(($first_number%$second_number))
                                echo "First number: $first_number divide (Remainder) Second number: $second_number --> $remainder"
                                ;;
                        *)
                                echo "Inavlid user input"
                                ;;
                esac
        fi
fi
