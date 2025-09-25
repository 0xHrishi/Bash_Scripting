#!/bin/bash
#Arithmetic operations --> case statement 

function lines {
        echo "*************************************************"
}

function first_number_right {
        [[ $first_number =~ ^[0-9-]+$ ]]
}
function second_number_right {
        [[ $second_number =~ ^[0-9-]+$ ]]
}

echo "User input should not be 0"
sleep 1

# Read user inputs
read -p "Enter the first number: " first_number
read -p "Enter the second number: " second_number

# Check if either input is empty
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

# User input is not empty
# Validate both inputs are numeric
# Show arithmetic operations menu
# Perform operation based on user input

elif [ -n "$first_number" ] && [ -n "$second_number" ]
then
        if ! first_number_right || ! second_number_right
        then
                if first_number_right && ! second_number_right
                then
                        lines
                        echo "Second number field must contain numeric values"
                elif ! first_number_right && second_number_right
                then
                        lines
                        echo "First number field must contain numeric values"
                elif ! first_number_right && ! second_number_right
                then
                        lines
                        echo "First number field must contain numeric values"
                        echo "Second number field must contain numeric values"
                fi
        elif first_number_right && second_number_right
        then
                lines
                echo "********Perform Arithmetic operations**********"
                echo "Press 1 : Addition"
                echo "Press 2 : Subtraction"
                echo "Press 3 : Multiplication"
                echo "Press 4 : Power"
                echo "Press 5 : Quotient"
                echo "Press 6 : Remainder"
                read option

                case $option in
                        1)
                                lines
                                sum=$(($first_number+$second_number))
                                echo "First number:$first_number plus Second number:$second_number --> $sum"
                                ;;
                        2)
                                lines
                                subtract=$(($first_numberr-$second_number))
                                echo "First number:$first_number minus Second number:$second_number --> $subtract"
                                ;;
                        3)
                                lines
                                multiply=$(($first_number*$second_number))
                                echo "First number:$first_number multiply Second number:$second_number --> $multiply"
                                ;;
                        4)
                                lines
                                power=$(($first_number**$second_number))
                                echo "First number:$first_number power Second number:$second_number --> $power"
                                ;;
                        5)
                                lines
                                quotient=$(($first_number/$second_number))
                                echo "First number:$first_number divide (Quotient) Second number:$second_number --> $quotient"
                                ;;
                        6)
                                lines
                                remainder=$(($first_number%$second_number))
                                echo "First number:$first_number divide (Remainder) Second number:$second_number --> $remainder"
                                ;;
                        *)
                                lines
                                echo "Invalid user input"
                esac


        fi
fi

