#!/bin/bash

# Multiplication of number using while loop
# PURPOSE : Print a visual separator for readability.
function lines {
        echo "*************************************************************"
}

# Function -- multiplicand_check, stop_number_check, multiplier_check
# PURPOSE : Validate that multiplicand is a positive integer and does NOT start with 0 
function multiplicand_check {
        [[ $multiplicand =~ ^[1-9][0-9]*$ ]]
}
function multiplier_check {
        [[ $multiplier =~ ^[1-9][0-9]*$ ]]
}
function stop_number_check {
        [[ $stop_number =~ ^[1-9][0-9]*$ ]]
}

echo "Warning: Do not enter numbers which starts with 0 e.g. 0,01,001"
sleep 0.5
# Prompt user for input
read -p "Enter the multiplicand number: " multiplicand
read -p "Enter the multiplier number:" multiplier
read -p "Enter the stop number:" stop_number

# CHECK : Any empty fields?
if [ -z "$multiplicand" ] || [ -z "$multiplier" ] || [ -z "$stop_number" ]
then
        if [ -n "$multiplicand" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                lines
                echo "User input -- Multiplier number is empty"
                echo "User input -- Stop number is empty"
        elif [ -n "$multiplicand" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                lines
                echo "User input -- Stop number is empty"
        elif [ -n "$multiplicand" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                lines
                echo "User input -- Multiplier number is empty"
        elif [ -z "$multiplicand" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
        then
                lines
                echo "User input -- Multiplicand number is empty"
        elif [ -z "$multiplicand" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                lines
                echo "User input -- Multiplicand number is empty"
                echo "User input -- Multiplier number is empty"
        elif [ -z "$multiplicand" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                lines
                echo "User input -- Multiplicand number is empty"
                echo "User input -- Stop number is empty"
        elif [ -z "$multiplicand" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                lines
                echo "User input -- Multiplicand number is empty"
                echo "User input -- Multiplier number is empty"
                echo "User input -- Stop number is empty"

        fi
# ALL THREE FIELDS ARE NON-EMPTY → NOW VALIDATE THEM
# ALL INPUTS VALID → PERFORM MULTIPLICATION LOGIC
elif [ -n "$multiplicand" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
then
        if ! multiplicand_check || ! multiplier_check || ! stop_number_check
        then
                if multiplicand_check && ! multiplier_check && ! stop_number_check
                then
                        lines
                        echo "Multiplier field must contains only numeric(positive) numbers"
                        echo "Stop number field must contains only numeric(positive) numbers"
                elif multiplicand_check && multiplier_check && ! stop_number_check
                then
                        lines
                        echo "Stop number field must contains only numeric(positive) numbers"
                elif multiplicand_check && ! multiplier_check && stop_number_check
                then
                        lines
                        echo "Multiplier field must contains only numeric(positive) numbers"
                elif ! multiplicand_check && multiplier_check && stop_number_check
                then
                        lines
                        echo "Multiplicand field must contains only numeric(positive) numbers"
                elif ! multiplicand_check && ! multiplier_check && stop_number_check
                then
                        lines
                        echo "Multiplicand field must contains only numeric(positive) numbers"
                        echo "Multiplier field must contains only numeric(positive) numbers"
                elif ! multiplicand_check && multiplier_check && ! stop_number_check
                then
                        lines
                        echo "Multiplicand field must contains only numeric(positive) numbers"
                        echo "Stop number field must contains only numeric(positive) numbers"
                elif ! multiplicand_check && ! multiplier_check && ! stop_number_check
                then
                        lines
                        echo "Multiplicand field must contains only numeric(positive) numbers"
                        echo "Multiplier field must contains only numeric(positive) numbers"
                        echo "Stop number field must contains only numeric(positive) numbers"
                fi
        elif multiplicand_check && multiplier_check && stop_number_check
        then
                multiply=$(($multiplicand*$multiplier))
                if [ $multiply -eq $stop_number ]
                then
                        lines
                        echo "Multiplicand number: $multiplicand times Multiplier number: $multiplier --> $multiply"
                        echo "Result: $multiply and Stop number: $stop_number are equal"
                elif [ $multiply -gt $stop_number ]
                then
                        lines
                        echo "Multiplicand number: $multiplicand times Multiplier number: $multiplier --> $multiply"
                        echo "Result: $multiply is greater than Stop number: $stop_number"
                elif [ $multiply -lt $stop_number ]
                then
                        while [ $multiply -lt $stop_number ]
                        do
                                lines
                                echo "Multiplicand number: $multiplicand times Multiplier number: $multiplier --> $multiply"
                                ((multiplier++))
                                multiply=$(($multiplicand*$multiplier))
                                sleep 0.2
                        done
                fi
        fi
fi

