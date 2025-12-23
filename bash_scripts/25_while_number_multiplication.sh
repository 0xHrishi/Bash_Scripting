#!/bin/bash
# Performs multiplication using a multiplicand and multiplier
# and continues multiplying until the result exceeds a stop number.

function lines {
        echo "****************************************************************************"
}

# color codes for error messages
red='\033[0;31m'
nf='\033[0m'

# Function to make sure only numeric values are expected
function multiplicand_check {
        [[ $multiplicand =~ ^[1-9][0-9]*$ ]]
}
function multiplier_check {
        [[ $multiplier =~ ^[1-9][0-9]*$ ]]
}
function stop_number_check {
        [[ $stop_number =~ ^[1-9][0-9]*$ ]]
}

echo "User input must not start with zero i.e. 0, 01, 001 .."
sleep 0.2 
# Prompt user input
read -p "Enter the multiplicand number: " multiplicand
read -p "Enter the multiplier number: " multiplier
read -p "Enter the stop number: " stop_number

# User input empty
if [ -z "$multiplicand" ] || [ -z "$multiplier" ] || [ -z "$stop_number" ]
then
        lines
        if [ -z "$multiplicand" ]
        then
                echo -e "${red}User input -- Multiplicand number field is empty${nf}"
        fi
        if [ -z "$multiplier" ]
        then
                echo -e "${red}User input -- multiplier number field is empty${nf}"
        fi
        if [ -z "$stop_number" ]
        then
                echo -e "${red}User input -- Stop number field is empty${nf}"
        fi

# User input not empty
# Validate the user input i.e. check whether they are numeric or not
# If numeric, 
# Case 1: Result equals stop number
# Case 2: Result already greater than stop number
# Case 3: Keep multiplying until result exceeds stop number
elif [ -n "$multiplicand" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
then
        if ! multiplicand_check || ! multiplier_check || ! stop_number_check
        then
                lines
                if ! multiplicand_check
                then
                        echo -e "${red}Multiplicand number field must contain only numeric values ${nf}"
                fi
                if ! multiplier_check
                then
                        echo -e "${red}Multiplier number field must contain only numeric values ${nf}"
                fi
                if ! stop_number_check
                then
                        echo -e "${red}Stop number field must contain only numeric values ${nf}"
                fi
        elif multiplicand_check && multiplier_check && stop_number_check
        then
                lines
                multiply_result=$(($multiplicand*$multiplier))

                if [ $multiply_result -eq $stop_number ]
                then
                        echo "Multiplicand: $multiplicand times $multiplier --> $multiply_result"
                        echo "Stop number --> $stop_number"
                        echo "Both number are equal"
                elif [ $multiply_result -gt $stop_number ]
                then
                        echo "Multiplicand: $multiplicand times $multiplier --> $multiply_result"
                        echo "Stop number --> $stop_number"
                        echo "Multiply result: $multiply_result is greater than $stop_number"
                elif [ $multiply_result -le $stop_number ]
                then
                        while [ $multiply_result -le $stop_number ]
                        do
                                echo "Multiplicand: $multiplicand times $multiplier --> $multiply_result"
                                ((multiplier++))
                                multiply_result=$(($multiplicand*$multiplier))
                                sleep 0.2
                        done
                fi
        fi
fi
