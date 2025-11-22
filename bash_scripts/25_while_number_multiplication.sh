#!/bin/bash
#user input --> number, multiplier, stop_number 
#multiplier increments by 1
#multiplication keep on going until the result of first*multiplier -le stop_number
#function
function lines {
        echo "*********************************************"
}

#user input
read -p "Enter the first number: " first
read -p "Enter the multiplier number: " multiplier
read -p "Enter the stop number: " stop_number

#check that the user input must contain only numeric values
function first_integer {
        [[ $first =~ ^[0-9]+$ ]]
}
function first_integer_wrong {
        [[ ! $first =~ ^[0-9]+$ ]]
}
function multiplier_integer {
        [[ $multiplier =~ ^[0-9]+$ ]]
}
function multiplier_integer_wrong {
        [[ ! $multiplier =~ ^[0-9]+$ ]]
}
function stop_number_integer {
        [[ $stop_number =~ ^[0-9]+$ ]]
}
function stop_number_integer_wrong {
        [[ ! $stop_number =~ ^[0-9]+$ ]]
}

#check user input if no input supplied 
if [ -z "$first" ] || [ -z "$multiplier" ] || [ -z "$stop_number" ]
then
        if [ -n "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                lines
                echo "User input --> Multiplier number field is empty"
                echo "User input --> Stop number field is empty"
        elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                lines
                echo "User input --> Stop number field is empty"
        elif [ -n "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                lines
                echo "User input --> Multiplier number field is empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
        then
                lines
                echo "User input --> First number field is empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                lines
                echo "User input --> First number field is empty"
                echo "User input --> Multiplier number field is empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                lines
                echo "User input --> First number field is empty"
                echo "User input --> Stop number field is empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                lines
                echo "User input --> First number field is empty"
                echo "User input --> Multiplier number field is empty"
                echo "User input --> Stop number field is empty"
        fi

#user input 
#check whether the user input contains only numeric values 
#Ifyes, do the multiplication 
elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
then
        if first_integer_wrong || multiplier_integer_wrong || stop_number_integer_wrong
        then
                if first_integer && multiplier_integer_wrong && stop_number_integer_wrong
                then
                        lines
                        echo "Multiplier number field must contain numeric values"
                        echo "Stop number field must contain numeric values"
                elif first_integer && multiplier_integer && stop_number_integer_wrong
                then
                        lines
                        echo "Stop number field must contain numeric values"
                elif first_integer && multiplier_integer_wrong && stop_number_integer
                then
                        lines
                        echo "Multiplier number field must contain numeric values"
                elif first_integer_wrong && multiplier_integer && stop_number_integer
                then
                        lines
                        echo "First number field must contain numeric values"
                elif first_integer_wrong && multiplier_integer_wrong && stop_number_integer
                then
                        lines
                        echo "First number field must contain numeric values"
                        echo "Multiplier number field must contain numeric values"
                elif first_integer_wrong && multiplier_integer && stop_number_integer_wrong
                then
                        lines
                        echo "First number field must contain numeric values"
                        echo "Stop number field must contain numeric values"
                elif first_integer_wrong && multiplier_integer_wrong && stop_number_integer_wrong
                then
                        lines
                        echo "First number field must contain numeric values"
                        echo "Multiplier number field must contain numeric values"
                        echo "Stop number field must contain numeric values"
                fi

        elif first_integer && multiplier_integer && stop_number_integer
        then
                multiply=$(($first*$multiplier))
                if [ $multiply -gt $stop_number ]
                then
                        lines
                        echo "$first times $multiplier --> $multiply"
                        echo "$multiply > $stop_number"
                        echo "Nothing to do"
                elif [ $multiply -eq $stop_number ]
                then
                        lines
                        echo "$first times $multiplier --> $multiply"
                        echo "$multiply == $stop_number"
                        echo "Nothing to do"
                elif [ $multiply -lt $stop_number ]
                then
                        while [ $multiply -lt $stop_number ]
                        do
                                lines
                                echo "$first times $multiplier --> $multiply"
                                ((multiplier++))
                                multiply=$(($first*$multiplier))
                                sleep 0.5
                        done
                fi
        fi
fi
