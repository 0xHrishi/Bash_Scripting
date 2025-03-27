#!/bin/bash

#script --> first number, multiplier, stop number
#script --> first number multiplies by multiplier until reaches stop number 

#user input 
echo "Enter the first number"
read first
echo "Enter the multiplier"
read multiplier
echo "Enter the stop number"
read stop_number

function lines {
        echo "************************************"
}

#function to make sure that the user input contain only numeric values
function first_right {
        [[ $first =~ ^[0-9]+$ ]]
}
function first_wrong {
        [[ ! $first =~ ^[0-9]+$ ]]
}
function multiplier_right {
        [[ $multiplier =~ ^[0-9]+$ ]]
}
function multiplier_wrong {
        [[ ! $multiplier =~ ^[0-9]+$ ]]
}
function stop_number_right {
        [[ $stop_number =~ ^[0-9]+$ ]]
}
function stop_number_wrong {
        [[ ! $stop_number =~ ^[0-9]+$ ]]
}


#user input field is empty
if [ -z "$first" ] || [ -z "$multiplier" ] || [ -z "$stop_number" ]
then
        if [ -n "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                lines
                echo "Stop number field is empty"
        elif [ -n "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                lines
                echo "Multiplier number field is empty"
        elif [ -n "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                lines
                echo "Multiplier number field is empty"
                echo "Stop number field is empty"
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
                echo "Issues with user input"
        fi
#user input not empty
elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
then
        #Check user input contains only numeric values
        if first_wrong || multiplier_wrong || stop_number_wrong
        then
                if first_right && multiplier_right && stop_number_wrong
                then
                        lines
                        echo "Stop number must contain only numeric values"
                elif first_right && multiplier_wrong && stop_number_right
                then
                        lines
                        echo "Multiplier number must contain only numeric values"
                elif first_right && multiplier_wrong && stop_number_wrong
                then
                        lines
                        echo "Multiplier number must contain only numeric values"
                        echo "Stop number must contain only numeric values"
                elif first_wrong && multiplier_wrong && stop_number_right
                then
                        lines
                        echo "First number must contain only numeric values"
                        echo "Multiplier number must contain only numeric values"
                elif first_wrong && multiplier_right && stop_number_right
                then
                        lines
                        echo "First number must contain only numeric values"
                elif first_wrong && multiplier_right && stop_number_wrong
                then
                        lines
                        echo "First number must contain only numeric values"
                        echo "Stop number must contain only numeric values"
                elif first_wrong && multiplier_wrong && stop_number_wrong
                then
                        lines
                        echo "First number must contain only numeric values"
                        echo "Multiplier number must contain only numeric values"
                        echo "Stop number must contain only numeric values"
                else
                        lines
                        echo "Issues with the user input"
                fi

        #user input contain only numeric values and perform the calculation
        elif first_right && multiplier_right && stop_number_right
        then
                result=$(($first*$multiplier))
                if [ $result -eq $stop_number ]
                then
                        lines
                        echo "$first times $multiplier --> $result"
                        echo "Result:$result is equal to Stop number:$stop_number"
                        echo "Nothing can be done"
                elif [ $result -gt $stop_number ]
                then
                        lines
                        echo "$first times $multiplier --> $result"
                        echo "Result:$result is greather than Stop number:$stop_number"
                        echo "Nothing can be done"
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
                fi
        fi
fi

