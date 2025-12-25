#!/bin/bash
# Calculates minimum down payment for a house based on the user's credit score
function lines {
        echo "****************************************************************"
}

# Color codes for error messages
red='\033[0;31m'
nf='\033[0m'

# Function to check, user input contain only numeric valuues, no leading zero
# (numeric values only)
function total_cost_check {
        [[ $total_cost =~ ^[1-9][0-9]*$ ]]
}
function credit_score_check {
        [[ $credit_score =~ ^[1-9][0-9]*$ ]]
}
# Read user inputs
read -p "Enter the total cost of the house: " total_cost
read -p "Enter the credit score: " credit_score

# User input empty
if [ -z "$total_cost" ] || [ -z "$credit_score" ]
then
        lines
        if [ -z "$total_cost" ]
        then
                echo -e "${red}User input --> Total cost of the house field is empty${nf}"
        fi
        if [ -z "$credit_score" ]
        then
                echo -e "${red}User input --> Credit score field is empty${nf}"
        fi

# User input not empty
# Validation check -- User input contain only numeric values
# Validation pass -- Calculate the down payment based upon the total cost and credit score
elif [ -n "$total_cost" ] && [ -n "$credit_score" ]
then
        if ! total_cost_check || ! credit_score_check
        then
                lines
                if ! total_cost_check
                then
                        echo -e "${red}Total cost of the house must be in numeric values${nf}"
                fi
                if ! credit_score_check
                then
                        echo -e "${red}Credit score must be in numeric values${nf}"
                fi
        elif total_cost_check && credit_score_check
        then
                lines
                if [ $credit_score -gt 999 ]
                then
                        echo -e "${red}Credit score cannot be greater than 999${nf}"
                elif [ $credit_score -ge 0 ] && [ $credit_score -le 999 ]
                then
                        if [ $credit_score -ge 750 ]
                        then
                                down_payment=$(($total_cost*10/100))
                                echo "Total cost of the house --> $total_cost"
                                echo "Credit score --> $credit_score"
                                echo "Minimum down payment --> $down_payment"
                        elif [ $credit_score -ge 650 ] && [ $credit_score -le 749 ]
                        then
                                down_payment=$(($total_cost*20/100))
                                echo "Total cost of the house --> $total_cost"
                                echo "Credit score --> $credit_score"
                                echo "Minimum down payment --> $down_payment"
                        elif [ $credit_score -ge 600 ] && [ $credit_score -le 649 ]
                        then
                                down_payment=$(($total_cost*30/100))
                                echo "Total cost of the house --> $total_cost"
                                echo "Credit score --> $credit_score"
                                echo "Minimum down payment --> $down_payment"
                        else
                                echo -e "${red}Cannot proceed with the application${nf}"
                        fi

                fi

        fi
fi
