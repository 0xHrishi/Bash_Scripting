#!/bin/bash
# Description  : Calculates total expenses and savings

function lines {
        echo "***************************************************************"
}
# color codes for error messages
RED='\033[0;31m'
NF='\033[0m'

# Function to validate user input
# Each function checks whether the input contains only numbers
# (integers or decimals) and does not start with zero
function total_income_check {
        [[ $total_income =~ ^[1-9][0-9.]*$ ]]
}
function rent_cost_check {
        [[ $rent_cost =~ ^[1-9][0-9.]*$ ]]
}
function groceries_cost_check {
        [[ $groceries_cost =~ ^[1-9][0-9.]*$ ]]
}
function transport_cost_check {
        [[ $transport_cost =~ ^[1-9][0-9.]*$ ]]
}
function utilities_cost_check {
        [[ $utilities_cost =~ ^[1-9][0-9.]*$ ]]
}
function extra_cost_check {
        [[ $extra_cost =~ ^[1-9][0-9.]*$ ]]
}

# prompt user input
read -p "Enter the total income: " total_income
read -p "Enter the rent cost: " rent_cost
read -p "Enter the groceries cost: " groceries_cost
read -p "Enter the transport cost: " transport_cost
read -p "Enter the utilities cost such as phone bill, gas, electricity: " utilities_cost
read -p "Enter the extra cost: " extra_cost

# user input empty
if [ -z "$total_income" ] || [ -z "$rent_cost" ] || [ -z "$groceries_cost" ] || [ -z "$transport_cost" ] || [ -z "$utilities_cost" ] || [ -z "$extra_cost" ]
then
        lines
        if [ -z "$total_income" ]
        then
                echo -e "${RED}User input --> Total income field is empty${NF}"
        fi
        if [ -z "$rent_cost" ]
        then
                echo -e "${RED}User input --> Rent cost field is empty${NF}"
        fi
        if [ -z "$groceries_cost" ]
        then
                echo -e "${RED}User input --> Groceries cost field is empty${NF}"
        fi
        if [ -z "$transport_cost" ]
        then
                echo -e "${RED}User input --> Transport cost field is empty${NF}"
        fi
        if [ -z "$utilities_cost" ]
        then
                echo -e "${RED}User input --> Utilities cost field is empty${NF}"
        fi
        if [ -z "$extra_cost" ]
        then
                echo -e "${RED}User input --> Extra cost field is empty${NF}"
        fi

# User input not empty
# User input check i.e. check the user input is a numeric value
# Calculate total expenses using bc (supports decimals)
elif [ -n "$total_income" ] && [ -n "$rent_cost" ] && [ -n "$groceries_cost" ] && [ -n "$transport_cost" ] && [ -n "$utilities_cost" ] && [ -n "$extra_cost" ]
then
        if ! total_income_check || ! rent_cost_check || ! groceries_cost_check || ! transport_cost_check || ! utilities_cost_check || ! extra_cost_check
        then
                lines
                if ! total_income_check
                then
                        echo -e "${RED}Total income field must contain only numeric values${NF}"
                fi
                if ! rent_cost_check
                then
                        echo -e "${RED}Rent cost field must contain only numeric values${NF}"
                fi
                if ! groceries_cost_check
                then
                        echo -e "${RED}Groceries cost field must contain only numeric values${NF}"
                fi
                if ! transport_cost_check
                then
                        echo -e "${RED}Transport cost field must contain only numeric values${NF}"
                fi
                if ! utilities_cost_check
                then
                        echo -e "${RED}Utilities cost field must contain only numeric values${NF}"
                fi
                if ! extra_cost_check
                then
                        echo -e "${RED}Extra cost field must contain only numeric values${NF}"
                fi
        elif  total_income_check && rent_cost_check && groceries_cost_check && transport_cost_check && utilities_cost_check && extra_cost_check
        then
                lines
                echo "Total income --> $total_income"
                echo "Rent cost --> $rent_cost"
                echo "Groceries cost --> $groceries_cost"
                echo "Transport cost --> $transport_cost"
                echo "Utilities cost --> $utilities_cost"
                echo "Extra cost --> $extra_cost"

                total_cost=$(bc <<< "$rent_cost + $groceries_cost + $transport_cost + $utilities_cost + $extra_cost")
                savings=$(bc <<< "$total_income - $total_cost")

                echo "Total cost --> $total_cost"
                echo "Savings --> $savings"
        fi

fi
