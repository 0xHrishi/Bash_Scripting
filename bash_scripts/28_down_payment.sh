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

# color codes for error
RED='\033[1;31m'
NF='\033[0m'

# function to validate user input i.e. only integer valuies accepted
# - Rejects zero and numbers starting with zero
function total_cost_check {
        [[ $total_cost =~ ^[1-9][0-9]*$ ]]
}
function credit_score_check {
        [[ $credit_score =~ ^[1-9][0-9]*$ ]]
}
#warning
echo "Do not enter user input starting with zero or zero"
echo
# user input
read -p "Enter the total cost of the house: " total_cost
read -p "Enter the credit score: " credit_score

# user iput empty
if [ -z "$total_cost" ] || [ -z "$credit_score" ]
then
        lines
        if [ -z "$total_cost" ]
        then
                echo -e "${RED}User input --> Total cost of the house field is empty${NF}"
        fi
        if [ -z "$credit_score" ]
        then
                echo -e "${RED}User input --> Credit score field is empty${NF}"
        fi
# user input not empty
# user input check,
# validation passed, caluclate the min down payment based upon the total cost and credit score
else
        lines
        if ! total_cost_check || ! credit_score_check
        then
                if ! total_cost_check
                then
                        echo -e "${RED}Total cost of the house field must contain only integer values${NF}"
                fi
                if ! credit_score_check
                then
                        echo -e "${RED}Credit score field must contain only integer values${NF}"
                fi
        else
                if [ $credit_score -gt 999 ]
                then
                        echo -e "${RED}Credit score cannot be greater than 999"
                else
                        echo "Total cost of the house --> $total_cost"
                        echo "Credit score --> $credit_score"
                        if [ $credit_score -ge 750 ]
                        then
                                down_payment=$(($total_cost*10/100))
                                echo "Minimum Down payment --> $down_payment"
                        elif [ $credit_score -ge 650 ] && [ $credit_score -lt 750 ]
                        then
                                down_payment=$(($total_cost*20/100))
                                echo "Minimum Down payment --> $down_payment"
                        elif [ $credit_score -ge 600 ] && [ $credit_score -lt 650 ]
                        then
                                down_payment=$(($total_cost*30/100))
                                echo "Minimum Down payment --> $down_payment"
                        else
                                echo -e "${RED}Cannot proceed with the application${NF}"
                        fi
                fi

        fi
fi
