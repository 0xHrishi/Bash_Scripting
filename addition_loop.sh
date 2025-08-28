#!/bin/bash

#user display two numbers first and second
#both numbers and add and the sum is added within another number as per the user choice
#function 
function lines {
        echo "**************************************"
}

#user input
read -p "Enter the first number " first_number
read -p "Enter the second number " second_number

#user input to check the it contains only numeric values
function first_right {
        [[ $first_number =~ ^[0-9]+$ ]]
}
function first_wrong {
        [[ ! $first_number =~ ^[0-9]+$ ]]
}
function second_right {
        [[ $second_number =~ ^[0-9]+$ ]]
}
function second_wrong {
        [[ ! $second_number =~ ^[0-9]+$ ]]
}

#function to go through the additon process once again 
#add the number to the result(sum) of first and second number
function addition_again {
        while [ "$option" == "y" ]
        do
                lines
                echo "Enter the number"
                read number
                result=$(($sum+$number))
                echo "$sum plus $number --> $result"
                sum=$result
                again
        done
}

#function to check whether the user would like to go through the additon once again 

function again {
        echo "Would you like to try again ? y/n"
        read option

        if [ "$option" == "y" ]
        then
                addition_again

        elif [ "$option" == "n" ]
        then
                lines
                echo "You choose to quit"
        else
                lines
                echo "Invalid user input"
        fi
}

#check user input, for any empty
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

#user input is not empty 
#also check the user contain only numeric values 
#addition
elif [ -n "$first_number" ] && [ -n "$second_number" ]
then
        if first_wrong || second_wrong
        then
                if first_right && second_wrong
                then
                        lines
                        echo "Second number field must contain only numeric values"
                elif first_wrong && second_right
                then
                        lines
                        echo "First number field must contain only numeric values"
                elif first_wrong && second_right
                then
                        lines
                        echo "First number field must contain only numeric values"
                        echo "Second number field must contain only numeric values"
                fi
        elif first_right && second_right
        then
                sum=$(($first_number+$second_number))
                echo "$first_number plus $second_number --> $sum"
                again
        fi


fi
