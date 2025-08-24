#!/bin/bash

#Script output -- even or odd numbers based upon the user input 

#function
function lines {
        echo "**************************************"
}

#user input
read -p "Enter the first number: " first
read -p "Enter the second number: " second

#check the user input only contains numeric values
function first_integer {
        [[ $first =~ ^[0-9]+$ ]]
}
function first_integer_wrong {
        [[ ! $first =~ ^[0-9]+$ ]]
}
function second_integer {
        [[ $second =~ ^[0-9]+$ ]]
}
function second_integer_wrong {
        [[ ! $second =~ ^[0-9]+$ ]]
}

#user input empty
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

#user input is not empty
#check the user input contain only nuemric values
#based upon the user input i.e. even or odd -- numbers are displayed. 

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
                if [ $first -eq $second ]
                then
                        lines
                        echo "$first is equal to $second"
                        echo "Cant do anything"
                elif [ $first -gt $second ]
                then
                        lines
                        echo "$first number is greater than $second"
                        echo "Cant do anything"
                elif [ $first -lt $second ]
                then
                        lines
                        echo "Would you like to print even or odd numbers"
                        read choice

                        if [ "$choice" == "even" ]
                        then
                                for even_numbers in $(seq $first $second)
                                do
                                        if (($even_numbers%2==0))
                                        then
                                                lines
                                                echo "Even mumber --> $even_numbers"
                                                sleep 0.3
                                        else
                                                sleep 0.3
                                                continue
                                        fi
                                done
                        elif [ "$choice" == "odd" ]
                        then
                                for odd_numbers in $(seq $first $second)
                                do
                                        if (($odd_numbers%2!=0))
                                        then
                                                lines
                                                echo "Odd mumber --> $odd_numbers"
                                                sleep 0.3
                                        else
                                                sleep 0.3
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
