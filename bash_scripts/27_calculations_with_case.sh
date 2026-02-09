#!/bin/bash

# Description : A menu-driven calculator written in Bash. Performs basic arithmetic operations

function lines {
        echo "*****************************************************"
}


# color codes
RED='\033[1;31m'
NF='\033[0m'

# function to check user input
function first_number_check {
        [[ $first_number =~ ^-?[1-9][0-9]*$ ]]
}
function second_number_check {
        [[ $second_number =~ ^-?[1-9][0-9]*$ ]]
}

# warning 
echo -e "${RED}Do not enter numbers starting with zero or a single digit zero${NF}"
sleep 0.2
echo
# user input
read -p "Enter the first number: " first_number
read -p "Enter the second number: " second_number

# user input is empty
if [ -z "$first_number" ] || [ -z "$second_number" ]
then
        lines
        if [ -z "$first_number" ]
        then
                echo -e "${RED}User input --> First number field is empty${NF}"
        fi
        if [ -z "$second_number" ]
        then
                echo -e "${RED}User input --> Second number field is empty${NF}"
        fi

# user input not empty
# validation check i.e. user input contain only integer values
# calidation pass --> Display calculator menu
# perform operation based on user choice
else
        if ! first_number_check || ! second_number_check
        then
                lines
                if ! first_number_check
                then
                        echo -e "${RED}First number field must contain only integer values${NF}"
                fi
                if ! second_number_check
                then
                        echo -e "${RED}Second number field must contain only integer values${NF}"
                fi
        else
                lines
                echo "Press 1 --> Addition"
                echo "Press 2 --> Subtraction"
                echo "Press 3 --> Multiplication"
                echo "Press 4 --> Power"
                echo "Press 5 --> Divide (Quotient)"
                echo "Press 6 --> Divide (Remainder)"
                read choice

                lines
                case $choice in
                        1)
                                sum=$(($first_number+$second_number))
                                echo "First number: $first_number plus Second number: $second_number --> $sum"
                                ;;
                        2)
                                minus=$(($first_number-$second_number))
                                echo "First number: $first_number minus Second number: $second_number --> $minus"
                                ;;
                        3)
                                multiply=$(($first_number*$second_number))
                                echo "First number: $first_number multiply Second number: $second_number --> $multiply"
                                ;;
                        4)
                                power=$(($first_number**$second_number))
                                echo "First number: $first_number power Second number: $second_number --> $power"
                                ;;
                        5)
                                quotient=$(($first_number/$second_number))
                                echo "First number: $first_number divide (quotient) Second number: $second_number --> $quotient"
                                ;;
                        6)
                                remainder=$(($first_number%$second_number))
                                echo "First number: $first_number divide (Remainder) Second number: $second_number --> $remainder"
                                ;;
                        *)
                                echo -e "${RED}Invalid user input${NF}"
                esac


        fi

fi
