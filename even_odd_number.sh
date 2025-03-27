#!/bin/bash

#script to display even or odd numbers 

#user input
echo "Enter the first number"
read first
echo "Enter the second number"
read second

function lines {
        echo "****************************************"
}

#function to make sure that the user input must contain only numeric values
function first_right {
        [[ $first =~ ^[0-9]+$ ]]
}
function first_wrong {
        [[ ! $first =~ ^[0-9]+$ ]]
}
function second_right {
        [[ $second =~ ^[0-9]+$ ]]
}
function second_wrong {
        [[ ! $second =~ ^[0-9]+$ ]]
}

#user input if empty
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
                echo "Issues with the user input"
        fi

#user input not empty
elif [ -n "$first" ] && [ -n "$second" ]
then
        #check whether user input contains only numeric values
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

        #user input contains only numeric values
        elif first_right && second_right
        then
                if [ $first -eq $second ]
                then
                        lines
                        echo "$first is equal to $second"
                        echo "Cannot do anything"
                elif [ $first -gt $second ]
                then
                        lines
                        echo "$first is greather than $second"
                        echo "Cannot do anything"
                elif [ $first -lt $second ]
                then
                        lines
                        echo "Would you like to print even or odd numbers"
                        read option
                        if [ "$option" == "even" ]
                        then
                                for even_numbers in $(seq $first $second)
                                do
                                        if (($even_numbers%2==0))
                                        then
                                                lines
                                                echo "Even number --> $even_numbers"
                                                sleep 0.5
                                        else
                                                sleep 0.5
                                                continue
                                        fi

                                done
                        elif [ "$option" == "odd" ]
                        then
                                for odd_numbers in $(seq $first $second)
                                do
                                        if (($odd_numbers%2!=0))
                                        then
                                                lines
                                                echo "Odd number --> $odd_numbers"
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
