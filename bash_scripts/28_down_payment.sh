#!/bin/bash
#=================================================================
# Description:
#   This script calculates the down payment for a house based on 
#   the user's total house cost and credit score.
#   Rules:
#     - Prevents input with leading zeros
#     - Validates credit score (0-999)
#     - Down payment based on credit score:
#         >= 750 : 10%
#         650-749: 20%
#         600-649: 30%
#         < 600  : Application rejected
# =================================================================

function lines {
        echo "***************************************************************"
}

# color codes for error messages
RED='\033[0;31m'
NF='\033[0m'

# function to validate the user input
# Function: Validate positive integers with no leading zeros
function total_cost_check {
        [[ $total_cost =~ ^[1-9][0-9]*$ ]]
}
function credit_score_check {
        [[ $credit_score =~ ^[1-9][0-9]*$ ]]
}

# user instructions
echo -e "${RED}Do not enter input leading with zero${NF}"
sleep 0.2
# User input
read -p "Enter the total cost of the house: " total_cost
read -p "Enter the credit score: " credit_score

# user input empty
if [ -z "$total_cost" ] || [ -z "$credit_score" ]
then
        lines
        if [ -z "$total_cost" ]
        then
                echo -e "${RED}User input --> Total cost field is empty"
        fi
        if [ -z "$credit_score" ]
        then
                echo -e "${RED}User input --> Credit score field is empty"
        fi
# User input provided
# valiudation check
# validation pass -- Calculate down payment based on credit score
elif [ -n "$total_cost" ] && [ -n "$credit_score" ]
then
        if ! total_cost_check || ! credit_score_check
        then
                lines
                if ! total_cost_check
                then
                        echo -e "${RED}Total cost of the house field must contain onyl numeric values${NF}"
                fi
                if ! credit_score_check
                then
                        echo -e "${RED}Credit score field must contain onyl numeric values${NF}"
                fi
        elif total_cost_check && credit_score_check
        then
                lines
                if [ $credit_score -gt 999 ]
                then
                        echo -e "${RED}Credit score cannot be greater than 999${NF}"
                fi
                if [ $credit_score -le 999 ]
                then
                        echo "Total cost of the house --> $total_cost"
                        echo "Credit score --> $credit_score"
                        if [ $credit_score -ge 750 ]
                        then
                                down_payment=$(($total_cost*10/100))
                                echo "Down payment --> $down_payment"
                        elif [ $credit_score -ge 650 ] && [ $credit_score -le 749 ]
                        then
                                down_payment=$(($total_cost*20/100))
                                echo "Down payment --> $down_payment"
                        elif [ $credit_score -ge 600 ] && [ $credit_score -le 649 ]
                        then
                                down_payment=$(($total_cost*30/100))
                                echo "Down payment --> $down_payment"
                        else
                                echo -e "${RED}Cannot proceed with the application${NF}"
                        fi
                fi
        fi

fi
