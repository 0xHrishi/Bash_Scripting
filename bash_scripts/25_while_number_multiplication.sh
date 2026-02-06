#!/bin/bash
# Bash script to multiply numbers until a stop value is reached

function lines {
        echo "**************************************"
}

# color codes for error messages
RED='\033[1;31m'
NF='\033[0m'

# fuinction to check user input
# user input must be positive integer number
function multiplicand_check {
        [[ $multiplicand =~ ^[1-9][0-9]*$ ]]                                                                                                                        
}                                                                                                                                                                   
function multiplier_check {                                                                                                                                         
        [[ $multiplier =~ ^[1-9][0-9]*$ ]]                                                                                                                          
}                                                                                                                                                                   
function stop_number_check {                                                                                                                                        
        [[ $stop_number =~ ^[1-9][0-9]*$ ]]                                                                                                                         
}

# instructions
echo -e "${RED}Do not enter number start with zero or zero${NF}"
sleep 0.2
# user input
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

# user input empty
# User input validation check
# All inputs are valid, If result is already >= stop number
# Loop until result reaches stop number
elif [ -n "$multiplicand" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
then
        lines
        if ! multiplicand_check || ! multiplier_check || ! stop_number_check
        then
                if ! multiplicand_check
                then
                        echo -e "${RED}Multiplicand number field must contain only numeric values${NF}"
                fi
                if ! multiplier_check
                then
                        echo -e "${RED}Multiplier number field must contain only numeric values${NF}"
                fi
                if ! stop_number_check
                then
                        echo -e "${RED}Stop number field must contain only numeric values${NF}"
                fi
        elif multiplicand_check && multiplier_check && stop_number_check
        then
                result=$(($multiplicand*$multiplier))
                if [ $result -ge $stop_number ]
                then
                        echo "Multiplicand: $multiplicand times Multiplier: $multiplier --> $result"
                        if [ $result -eq $stop_number ]
                        then
                                echo -e "${RED}Result: $result is equal to Stop number: $stop_number${NF}"
                                echo -e "${RED}Nothing can be done${NF}"
                        elif [ $result -gt $stop_number ]
                        then
                                echo -e "${RED}Result: $result is greater than Stop number: $stop_number${NF}"
                                echo -e "${RED}Nothing can be done${NF}"
                        fi
                elif [ $result -lt $stop_number ]
                then
                        while [ $result -lt $stop_number ]
                        do
                                echo "Multiplicand: $multiplicand times Multiplier: $multiplier --> $result"
                                ((multiplier++))
                                result=$(($multiplicand*$multiplier))
                                sleep 0.5
                        done
                fi
        fi
fi
