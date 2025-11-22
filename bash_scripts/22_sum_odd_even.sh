#!/bin/bash
#User input two numbers first and second 
#Both numbers and add, the sum is even or odd number 

#function to print lines
function lines {
        echo "*********************************************"
}

#short discription about the script
echo "This script adds two numbers and display whether the sum of two numbers is odd or even"
sleep 0.2

#user input
read -p "Enter the first number: " first
read -p "Enter the second number: " second

#functions, user input i.e. first and second must contain only numeric values
function first_integer {
        [[ $first =~ ^[0-9-]+$ ]]
}
function first_not_integer {
        [[ ! $first =~ ^[0-9-]+$ ]]
}
function second_integer {
        [[ $second =~ ^[0-9-]+$ ]]
}
function second_not_integer {
        [[ ! $second =~ ^[0-9-]+$ ]]
}

#function to add the first and second number
function add {
        echo "First number is --> $first"
        echo "Second number is --> $second"
        sum=$(($first+$second))
        echo "$first plus $second --> $sum "
}

#Check whether the user input is empty
if [ -z "$first" ] || [ -z "$second" ]
then
        if [ -n "$first" ] && [ -z "$second" ]
        then
                lines
                echo "User input --> Second number field is empty"
        elif [ -z "$first" ] && [ -n "$second" ]
        then
                lines
                echo "User input --> First number field is empty"
        elif [ -z "$first" ] && [ -z "$second" ]
        then
                lines
                echo "User input --> First number field is empty"
                echo "User input --> Second number field is empty"
        fi
#User input is not empty
#Inside the elif statment, first and second number must contain only numeric values
#With first and seocnd number as valid input, call the add function which add first and second number 

elif [ -n "$first" ] && [ -n "$second" ]
then
        if first_not_integer || second_not_integer
        then
                if first_integer && second_not_integer
                then
                        lines
                        echo "User input --> Second number field must contain numeric values"
                elif first_not_integer && second_integer
                then
                        lines
                        echo "User input --> First number field must contain numeric values"
                elif first_not_integer && second_not_integer
                then
                        lines
                        echo "User input --> First number field must contain numeric values"
                        echo "User input --> Second number field must contain numeric values"
                fi
        elif first_integer && second_integer
        then
                sum=$(($first+$second))
                if (($sum%2==0))
                then
                        lines
                        add
                        echo "$sum is even number"
                elif (($sum%2!=0))
                then
                        lines
                        add
                        echo "$sum is odd number"
                fi
        fi
fi
