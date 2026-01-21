#!/bin/bash

# Description : Multiplies a multiplicand and multiplier.
#               If the result is less than the stop number,
#               the multiplier is incremented until the
#               result reaches or exceeds the stop number.

function lines {
        echo "****************************************************************"
}

# color codes for error message
RED='\033[0;31m'
NF='\033[0m'

# function to validate the user input
# only positive numeric values allowed
# no zero, no leading zero
function multiplicand_check {
        [[ $multiplicand =~ ^[1-9][0-9]*$ ]]
}
function multiplier_check {
        [[ $multiplier =~ ^[1-9][0-9]*$ ]]
}
function stop_number_check {
        [[ $stop_number =~ ^[1-9][0-9]*$ ]]
}

# User instruction
echo -e "${RED}Do not enter numbers with leading zero or negative numbers${NF}"
sleep 0.2
# Prompt for user input
read -p "Enter the multiplicand number: " multiplicand
read -p "Enter the multiplier number: " multiplier
read -p "Enter the stop number: " stop_number

# user input empty
if [ -z "$multiplicand" ] || [ -z "$multiplier" ] || [ -z "$stop_number" ]
then
        lines
        if [ -z "$multiplicand" ]
        then
                echo -e "${RED}User input --> Multiplicand number field is empty${NF}"
        fi
        if [ -z "$multiplier" ]
        then
                echo -e "${RED}User input --> Multiplier number field is empty${NF}"
        fi
        if [ -z "$stop_number" ]
        then
                echo -e "${RED}User input --> Stop number field is empty${NF}"
        fi

# user input not empty
# validate the user input 
# Multiplication i.e. multiplicand * multiplier number
# compare the result with stop number
# increment the multiplier 
elif [ -n "$multiplicand" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
then
        if ! multiplicand_check || ! multiplier_check || ! stop_number_check
        then
                lines
                if ! multiplicand_check
                then
                        echo -e "${RED}Multiplicand number must contain only positive integers${NF}"
                fi
                if ! multiplier_check
                then
                        echo -e "${RED}Multiplier number must contain only positive integers${NF}"
                fi
                if ! stop_number_check
                then
                        echo -e "${RED}Stop number must contain only positive integers${NF}"
                fi

        elif multiplicand_check && multiplier_check && stop_number_check
        then
                lines
                result=$(($multiplicand*$multiplier))
                if [ $result -eq $stop_number ]
                then
                        echo -e "${RED}Multiplicand number: $multiplicand times Multiplier: $multiplier --> $result${NF}"
                        echo -e "${RED}Result: $result is equal to Stop number: $stop_number${NF}"
                elif [ $result -gt $stop_number ]
                then
                        echo -e "${RED}Multiplicand number: $multiplicand times Multiplier: $multiplier --> $result${NF}"
                        echo -e "${RED}Result: $result is greater than Stop number: $stop_number${NF}"
                elif [ $result -lt $stop_number ]
                then
                        while [ $result -lt $stop_number ]
                        do
                                echo -e "${RED}Multiplicand number: $multiplicand times Multiplier: $multiplier --> $result${NF}"
                                ((multiplier++))
                                result=$(($multiplicand*$multiplier))
                                sleep 0.2
                        done
                fi

        fi
fi
