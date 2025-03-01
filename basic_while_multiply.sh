#!/bin/bash

#User inout --> first number, multiplier, stop number
#first number gets multiply by multiplier which incremenets by 1 every iteration until it reaches stop numner 

#user input --> first, multiplier and stop number
echo "Enter the first number"
read first
echo "Enter the multiplier number"
read multiplier
echo "Enter the stop number"
read stop_number

#created function
function lines {
        echo "********************************"
}

#function to check the first number must accept only numeric values
function first_right {
        [[ $first =~ ^[0-9]+$ ]]
}
function first_wrong {
        [[ ! $first =~ ^[0-9]+$ ]]
}

#function to check the multiplier number must accept only numeric values
function multiplier_right {
        [[ $multiplier =~ ^[0-9]+$ ]]
}
function multiplier_wrong {
        [[ ! $multiplier =~ ^[0-9]+$ ]]
}

#function to check the stop number must accept only numeric values
function stop_number_right {
        [[ $stop_number =~ ^[0-9]+$ ]]
}
function stop_number_wrong {
        [[ ! $stop_number =~ ^[0-9]+$ ]]
}

#Condition to check whether the user input is empty or the length of the string is equal to zero
if [ -z "$first" ] || [ -z "$multiplier" ] || [ -z "$stop_number" ]
then
        if [ -n "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                lines
                echo "Multiplier number field is empty"
                echo "Stop number field is empty"
        elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                lines
                echo "Stop number field is empty"
        elif [ -n "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                lines
                echo "Multiplier number field is empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                lines
                echo "First number field is empty"
                echo "Multiplier number field is empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
        then
                lines
                echo "First number field is empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                lines
                echo "First number field is empty"
                echo "Stop number field is empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                lines
                echo "First number field is empty"
                echo "Multiplier number field is empty"
                echo "Stop number field is empty"
        else
                lines
                echo "Issues with the user input"
        fi

#Condition to check when the user input is not empty or the length of the string is greather than zero
#Conditon to check whether the user input must contain only numeric values, if doesnt display error 

elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
then
        if first_wrong || multiplier_wrong || stop_number_wrong
        then
                if first_right && multiplier_wrong && stop_number_wrong
                then
                        lines
                        echo "Multiplier number field must contain only numeric values"
                        echo "Stop number field must contain only numeric values"
                elif first_right && multiplier_right && stop_number_wrong
                then
                        lines
                        echo "Stop number field must contain only numeric values"
                elif first_right && multiplier_wrong && stop_number_right
                then
                        lines
                        echo "Multiplier number field must contain only numeric values"
                elif first_wrong && multiplier_wrong && stop_number_right
                then
                        lines
                        echo "First number field must contain only numeric values"
                        echo "Multiplier number field must contain only numeric values"
                elif first_wrong && multiplier_right && stop_number_right
                then
                        lines
                        echo "First number field must contain only numeric values"
                elif first_wrong && multiplier_right && stop_number_wrong
                then
                        lines
                        echo "First number field must contain only numeric values"
                        echo "Stop number field must contain only numeric values"
                elif first_wrong && multiplier_wrong && stop_number_wrong
                then
                        lines
                        echo "First number field must contain only numeric values"
                        echo "Multiplier number field must contain only numeric values"
                        echo "Stop number field must contain only numeric values"
                else
                        lines
                        echo "Issues with the user input validation"
                fi

        #user input contain only numeric values
        #first number multiplies by multiplier, every iteration the multiplier increases by 1 and does iteration until reaches stop number 
        
        elif first_right && multiplier_right && stop_number_right
        then
                result=$(($first*$multiplier))
                if [ $result -eq $stop_number ]
                then
                        lines
                        echo "First number i.e. $first times Multiplier i.e. $multiplier --> $result"
                        echo "$first times $multiplier --> $result"
                        echo "Nothing to do"
                elif [ $result -gt $stop_number ]
                then
                        lines
                        echo "First number i.e. $first times Multiplier i.e. $multiplier --> $result"
                        echo "$result is greather than stop number i.e. $stop_number"
                        echo "Nothing to do"
                elif [ $result -lt $stop_number ]
                then
                        while [ $result -lt $stop_number ]
                        do
                                lines
                                echo "$first times $multiplier --> $result"
                                ((multiplier++))
                                result=$(($first*$multiplier))
                                sleep 0.5
                        done
                else
                        lines
                        echo "Issues with the calculation"
                fi

        fi
fi

