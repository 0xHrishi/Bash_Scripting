#!/bin/bash
# Script -- To calculate the down payment based upon the total cost of the house and credit score 

function lines {
        echo "*************************************************************"
}
# Function to validate total cost and credit score (must be a positive integer without leading zeros)
function total_cost_check {
        [[ $total_cost =~ ^[1-9][0-9]*$ ]]
}
function credit_check {
        [[ $credit =~ ^[1-9][0-9]*$ ]]
}

# Warning 
echo "Do not enter the user input with leading zero i.e. 0, 01, 001"
sleep 0.2

# User input
read -p  "Enter the total cost of the house: " total_cost
read -p  "Enter the credit score: " credit

# If user input empty 
if [ -z "$total_cost" ] || [ -z "$credit" ]
then
        if [ -n "$total_cost" ] && [ -z "$credit" ]
        then
                lines
                echo "User input -- Credit score field is empty"
        elif [ -z "$total_cost" ] && [ -n "$credit" ]
        then
                lines
                echo "User input -- Total cost of the house field is empty"
        elif [ -z "$total_cost" ] && [ -z "$credit" ]
        then
                lines
                echo "User input -- Total cost of the house field is empty"
                echo "User input -- Credit score field is empty"
        fi

# User input not empty
# Check user input i.e. validation
# If all ok, Based upon the credit score and total cost of the house
# Calculate the down payment 
elif [ -n "$total_cost" ] && [ -n "$credit" ]
then
        if ! total_cost_check || ! credit_check
        then
                if total_cost_check && ! credit_check
                then
                        lines
                        echo "Credit score field must contain only numeric values"
                elif ! total_cost_check && credit_check
                then
                        lines
                        echo "Total cost of the house field must contain only numeric values"
                elif ! total_cost_check && ! credit_check
                then
                        lines
                        echo "Total cost of the house field must contain onny numeric values"
                        echo "Credit score field must contain only numeric values"
                fi
        elif  total_cost_check && credit_check
        then
                if [ $credit -ge 1000 ]
                then
                        lines
                        echo "Credit score field cannot be greater than or equal to 1000"
                elif [ $credit -ne 0 ] && [ $credit -le 999 ]
                then
                        if [ $credit -ge 750 ]
                        then
                                lines
                                down_payment=$(($total_cost*10/100))
                                echo "Total cost of the house --> $total_cost"
                                echo "Credit score --> $credit"
                                echo "Minimum down payment --> $down_payment"
                        elif [ $credit -le 749 ] && [ $credit -ge 650 ]
                        then
                                lines
                                down_payment=$(($total_cost*20/100))
                                echo "Total cost of the house --> $total_cost"
                                echo "Credit score --> $credit"
                                echo "Minimum down payment --> $down_payment"
                        elif [ $credit -le 649 ] && [ $credit -ge 600 ]
                        then
                                lines
                                down_payment=$(($total_cost*30/100))
                                echo "Total cost of the house --> $total_cost"
                                echo "Credit score --> $credit"
                                echo "Minimum down payment --> $down_payment"
                        else
                                lines
                                echo "Cannot proceed with the application"
                        fi
                fi
        fi
fi
