#!/bin/bash
# User inpout -- Total cost of the house, credit score and based upon that, calculate the down payment 

# Function: Print a separator line for better readability
function lines {
        echo "*************************************************************"
}

# Function: total_cost_check, credit_score_check
# Accepts only positive integers without leading zeros
function total_cost_check {
        [[ $total_cost =~ ^[1-9][0-9]*$ ]]
}
function credit_score_check {
        [[ $credit_score =~ ^[1-9][0-9]*$ ]]
}
lines
echo "Please do not provide input leading with zero, eg:0,01,001"
lines
sleep 0.5

# Read user inputs
read -p "Enter the total cost of the house: " total_cost
read -p "Enter the credit_score: " credit_score

# Check if any of the inputs are empty
if [ -z "$total_cost" ] || [ -z "$credit_score" ]
then
        if [ -n "$total_cost" ] && [ -z "$credit_score" ]
        then
                lines
                echo "User input -- Credit score field is empty"
        elif [ -z "$total_cost" ] && [ -n "$credit_score" ]
        then
                lines
                echo "User input -- Total cost of the house field is empty"
        elif [ -z "$total_cost" ] && [ -z "$credit_score" ]
        then
                lines
                echo "User input -- Total cost of the house field is empty"
                echo "User input -- Credit score field is empty"
        fi

# If both fields are filled
# If both inputs are valid numbers

elif [ -n "$total_cost" ] && [ -n "$credit_score" ]
then
        if ! total_cost_check || ! credit_score_check
        then
                if total_cost_check && ! credit_score_check
                then
                        lines
                        echo "User input -- Credit score field invalid entry"
                elif ! total_cost_check && credit_score_check
                then
                        lines
                        echo "User input -- Total cost of the house field invalid entry"
                elif ! total_cost_check && ! credit_score_check
                then
                        lines
                        echo "User input -- Total cost of the house field invalid entry"
                        echo "User input -- Credit score field invalid entry"
                fi
        elif total_cost_check && credit_score_check
        then
                if [ $credit_score -gt 999 ]
                then
                        lines
                        echo "Credit score cannot be greater than 999"
                elif [ $credit_score -le 999 ]
                then
                        if [ $credit_score -ge 750 ]
                        then
                                lines
                                down_payment=$(($total_cost*10/100))
                                echo "Total cost of the house -- $total_cost"
                                echo "Credit score -- $credit_score"
                                echo "Down payment -- $down_payment"
                        elif [ $credit_score -ge 650 ] && [ $credit_score -le 749 ]
                        then
                                lines
                                down_payment=$(($total_cost*20/100))
                                echo "Total cost of the house -- $total_cost"
                                echo "Credit score -- $credit_score"
                                echo "Down payment -- $down_payment"
                        elif [ $credit_score -ge 600 ] && [ $credit_score -le 649 ]
                        then
                                lines
                                down_payment=$(($total_cost*30/100))
                                echo "Total cost of the house -- $total_cost"
                                echo "Credit score -- $credit_score"
                                echo "Down payment -- $down_payment"
                        else
                                lines
                                echo "Cannot proceed with the application"
                        fi
                fi
        fi

fi
