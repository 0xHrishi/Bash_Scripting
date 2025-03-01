#!/bin/bash

#didplay even or odd numbers within range
#User input first and second number
#Ask user to print even or odd number

#user input--> first and second number
echo "Enter the first number"
read first
echo "Enter the second number"
read second

function lines {
        echo "*************************************"
}

#function to check the first number contain only numeric values 
function first_right {
        [[ $first =~ ^[0-9]+$ ]]
}
function first_wrong {
        [[ ! $first =~ ^[0-9]+$ ]]
}

#function to check the second number contain only numeric values 
function second_right {
        [[ $second =~ ^[0-9]+$ ]]
}
function second_wrong {
        [[ ! $second =~ ^[0-9]+$ ]]
}

#Check user input is empty 
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

#user input is not empty
elif [ -n "$first" ] && [ -n "$second" ]
then

        #User input must contain numeric values 
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
                        echo "Issues with the user input validation"
                fi

        #User input contain numeric values 
        elif first_right && second_right
        then
                if [ $first -eq $second ]
                then
                        lines
                        echo "First number i.e. $first is equal to Second number i.e. $second"
                        echo "Nothing to do"
                elif [ $first -gt $second ]
                then
                        lines
                        echo "First number i.e. $first is greather than Second number i.e. $second"
                        echo "Nothing to do"
                elif [ $first -le $second ]
                then
                        lines
                        echo "Would you like to print odd or even numbers"
                        read option
                        if [ "$option" == "even" ]
                        then

                                #for loop to display even numbers
                                for even_numbers in $(seq $first $second)
                                do
                                        if (($even_numbers%2==0))
                                        then
                                                echo "Even number is --> $even_numbers"
                                                sleep 0.5
                                        else
                                                sleep 0.5
                                                continue
                                        fi
                                done
                        elif [ "$option" == "odd" ]
                        then
                                #for loop to display even numbers
                                for odd_numbers in $(seq $first $second)
                                do
                                        if (($odd_numbers%2!=0))
                                        then
                                                echo "Odd number is --> $odd_numbers"
                                                sleep 0.5
                                        else
                                                sleep 0.5
                                                continue
                                        fi
                                done
                        else
                                lines
                                echo "Invalid user input"
                        fi
                fi
        fi
fi
