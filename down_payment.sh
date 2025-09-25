#!/bin/bash
#   This script prompts the user to enter the total cost of a house
#   and their credit score. Based on the credit score, it calculates
#   the required down payment percentage:
#   If the user enters total cost as 010000 (with leading zero),
#   Bash treats numbers with leading zeros as octal by default.
#   To force decimal arithmetic and avoid octal interpretation,
#   we use 10# in calculations:
#       down_payment=$((10#$total_cost * 10 / 100))


function lines {
        echo "*************************************************"
}

# Function to check if total_cost contains only numbers
# Function to check if credit_score contains only numbers

function total_cost_right {
        [[ $total_cost =~ ^[0-9]+$ ]]
}
function credit_score_right {
        [[ $credit_score =~ ^[0-9]+$ ]]
}

read -p "Enter the total cost of the house: " total_cost
read -p "Enter the credit score: " credit_score

# Check if any of the inputs are empty
if [ -z "$total_cost" ] || [ -z "$credit_score" ]
then
        if [ -n "$total_cost" ] && [ -z "$credit_score" ]
        then
                lines
                echo "User input --> Credit score field is empty"
        elif [ -z "$total_cost" ] && [ -n "$credit_score" ]
        then
                lines
                echo "User input --> Total cost of the house field is empty"
        elif [ -z "$total_cost" ] && [ -z "$credit_score" ]
        then
                lines
                echo "User input --> Total cost of the house field is empty"
                echo "User input --> Credit score field is empty"
        fi

# If both inputs are provided
elif [ -n "$total_cost" ] && [ -n "$credit_score" ]
then
        if ! total_cost_right || ! credit_score_right
        then
                if total_cost_right && ! credit_score_right
                then
                        lines
                        echo "Credit score field must contain numeric values"
                elif ! total_cost_right && credit_score_right
                then
                        lines
                        echo "Total cost of the house field must contain numeric values"
                elif ! total_cost_right && ! credit_score_right
                then
                        lines
                        echo "Total cost of the house field must contain numeric values"
                        echo "Credit score field must contain numeric values"
                fi
        elif total_cost_right && credit_score_right
        then
                if [ $credit_score -gt 999 ]
                then
                        lines
                        echo "Credit score cannot be greater than 999"
                elif [ $credit_score -ge 0 ] || [ $credit_score -le 999 ]
                then
                        if [ $credit_score -ge 750 ] && [ $credit_score -le 999 ]
                        then
                                lines
                                down_payment=$(($total_cost*10/100))
                                echo "Total cost of the house --> $total_cost"
                                echo "Credit score --> $credit_score"
                                echo "Down payment --> $down_payment"
                        elif [ $credit_score -ge 650 ] && [ $credit_score -le 749 ]
                        then
                                lines
                                down_payment=$(($total_cost*20/100))
                                echo "Total cost of the house --> $total_cost"
                                echo "Credit score --> $credit_score"
                                echo "Down payment --> $down_payment"
                        elif [ $credit_score -ge 600 ] && [ $credit_score -le 649 ]
                        then
                                lines
                                down_payment=$(($total_cost*30/100))
                                echo "Total cost of the house --> $total_cost"
                                echo "Credit score --> $credit_score"
                                echo "Down payment --> $down_payment"
                        else
                                lines
                                echo "Cannot proceed with the application"
                        fi
                fi
        fi
fi
