#!/bin/bash

#Script --> Add two numbers and result is odd or even number

#User input i.e. first and second number
echo "Enter the first number"
read first
echo "Enter the second number"
read second

#function
function lines {
        echo "************************************************"
}

#Function to check i.e. first number must contain only numeric valies
function first_right {
        [[ $first =~ ^[0-9-]+$ ]]
}
function first_wrong {
        [[ ! $first =~ ^[0-9-]+$ ]]
}

#function i.e. second number must contain only numeric values
function second_right {
        [[ $second =~ ^[0-9-]+$ ]]
}
function second_wrong {
        [[ ! $second =~ ^[0-9-]+$ ]]
}

#Check whether the user input is empty 
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
        else
                lines
                echo "Issues with the user input"
        fi

#User input is not empty 
elif [ -n "$first" ] && [ -n "$second" ]
then
        #Check whether the user input i.e. first and second number contain only numeric values
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
                elif first_wrong && second_wrong
                then
                        lines
                        echo "First number field must contain only numeric values"
                        echo "Second number field must contain only numeric values"
                else
                        lines
                        echo "Issues with user input validation"
                fi

        #user input i.e. first and second number contain numeric values
        elif first_right && second_right
        then
                #Add two numbers, result dvidied by 2 and display whether the sum of first and second number is even or odd
                ans=$(($first+$second))
                if (($ans%2==0))
                then
                        lines
                        echo "$first plus $second --> $ans"
                        echo "$ans --> Even number"
                elif (($ans%2!=0))
                then
                        lines
                        echo "$first plus $second --> $ans"
                        echo "$ans --> Odd number"
                else
                        lines
                        echo "Something went wrong"
                fi
        fi
fi
