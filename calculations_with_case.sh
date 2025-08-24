#!/bin/bash
#script which perform arithmetic calculation using case statement

#function
function lines {
        echo "*********************************************"
}

#user input
read -p "Enter the first number: " first
read -p "Enter the second number: " second

#function to check that the user input must contain only numeric values
function first_integer {
        [[ $first =~ ^[0-9-]+$ ]]
}
function first_integer_wrong {
        [[ ! $first =~ ^[0-9-]+$ ]]
}
function second_integer {
        [[ $second =~ ^[0-9-]+$ ]]
}
function second_integer_wrong {
        [[ ! $second =~ ^[0-9-]+$ ]]
}

#if user input is empty
if [ -z "$first" ] || [ -z "$second" ]
then
        if [ -n "$first" ] && [ -z "$second" ]
        then
                lines
                echo "Second number field is empty"
        elif [ -z "$first" ] && [ -n "$second" ]
        then
                lines
                echo "First number field is empty"
        elif [ -z "$first" ] && [ -z "$second" ]
        then
                lines
                echo "First number field is empty"
                echo "Second number field is empty"
        fi

#user input is not empty
#user input must contain only numeric values
#perform calculation as per the user choice such as addition, sub, multiplication, power, division with case statement. 
elif [ -n "$first" ] && [ -n "$second" ]
then
        if first_integer_wrong || second_integer_wrong
        then
                if first_integer && second_integer_wrong
                then
                        lines
                        echo "Second number field must contain only numeric values"
                elif first_integer_wrong && second_integer
                then
                        lines
                        echo "First number field must contain only numeric values"
                elif first_integer_wrong && second_integer_wrong
                then
                        lines
                        echo "First number field must contain only numeric values"
                        echo "Second number field must contain only numeric values"
                fi
        elif first_integer && second_integer
        then
                lines
                echo "Press 1: Addition"
                echo "Press 2: Subtraction"
                echo "Press 3: Multiplication"
                echo "Press 4: Power"
                echo "Press 5: Quotient"
                echo "Press 6: Remainder"
                read choice
                lines

                case $choice in
                        1)
                                sum=$(($first+$second))
                                echo "First number :$first plus Second number:$second --> $sum"
                                ;;
                        2)
                                sub=$(($first-$second))
                                echo "First number :$first minus Second number:$second --> $sub"
                                ;;
                        3)
                                mul=$(($first*$second))
                                echo "First number :$first multiply Second number:$second --> $mul"
                                ;;
                        4)
                                power=$(($first**$second))
                                echo "First number :$first power Second number:$second --> $power"
                                ;;
                        5)
                                quotient=$(($first/$second))
                                echo "First number :$first divide(Quotient) Second number:$second --> $quotient"
                                ;;
                        6)
                                remainder=$(($first%$second))
                                echo "First number :$first divide(Remainder) Second number:$second --> $remainder"
                                ;;
                        *)
                                echo "Invalid user input"
                esac
        fi
fi
