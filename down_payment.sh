#!/bin/bash
# Calculates house down payment percentage based on credit score.

function lines {
        echo "******************************************************************************"
}

# Function to check if total_cost and credit_score contains only numeric digits
function total_cost_check {
        [[ $total_cost =~ ^[0-9]+$ ]]
}
function credit_score_check {
        [[ $credit_score =~ ^[0-9]+$ ]]
}

# Prompt user for inputs
read -p "Enter the total cost of the house: " total_cost
read -p "Enter the credit score: " credit_score

# Check for empty inputs
if [ -z "$total_cost" ] || [ -z "$credit_score" ]
then
        if [ -n "$total_cost" ] && [ -z "$credit_score" ]
        then
                lines
                echo "User input --> Credit score field is empty"
        elif [ -z "$total_cost" ] && [ -n "$credit_score" ]
        then
                lines
                echo "User input --> Total cost field is empty"
        elif [ -z "$total_cost" ] && [ -z "$credit_score" ]
        then
                lines
                echo "User input --> Total cost field is empty"
                echo "User input --> Credit score field is empty"
        fi

# Both inputs are provided
# Inputs are valid numeric values
# Credit score is within valid range
elif [ -n "$total_cost" ] && [ -n "$credit_score" ]
then
        if ! total_cost_check || ! credit_score_check
        then
                if total_cost_check && ! credit_score_check
                then
                        lines
                        echo "Credit score field must contain only numeric values"
                elif ! total_cost_check && credit_score_check
                then
                        lines
                        echo "Total cost field must contain only numeric values"
                elif ! total_cost_check && ! credit_score_check
                then
                        lines
                        echo "Total cost field must contain only numeric values"
                        echo "Credit score field must contain only numeric values"
                fi
        elif total_cost_check && credit_score_check
        then
                if [ "$credit_score" -eq 0 ] || [ "$credit_score" -gt 999 ]
                then
                        if [ "$credit_score" -eq 0 ]
                        then
                                lines
                                echo "Credit score cannot be less than 0"
                        elif [ "$credit_score" -gt 999 ]
                        then
                                lines
                                echo "Credit score cannot be greater than 999"
                        fi
                elif [ "$credit_score" -gt 0 ] && [ "$credit_score" -le 999 ]
                then
                        if [ "$credit_score" -ge 750 ]
                        then
                                lines
                                echo "Total cost of the house --> $total_cost"
                                echo "Credit score --> $credit_score"
                                down_payment=$((10#$total_cost*10/100))
                                echo "Down payment --> $down_payment"
                        elif [ "$credit_score" -ge 650 ] && [ "$credit_score" -le 749 ]
                        then
                                lines
                                echo "Total cost of the house --> $total_cost"
                                echo "Credit score --> $credit_score"
                                down_payment=$((10#$total_cost*20/100))
                                echo "Down payment --> $down_payment"
                        elif [ "$credit_score" -ge 600 ] && [ "$credit_score" -le 649 ]
                        then
                                lines
                                echo "Total cost of the house --> $total_cost"
                                echo "Credit score --> $credit_score"
                                down_payment=$((10#$total_cost*30/100))
                                echo "Down payment --> $down_payment"
                        else
                                lines
                                echo "Cannot proceed with the application"
                        fi
                fi
        fi
fi

