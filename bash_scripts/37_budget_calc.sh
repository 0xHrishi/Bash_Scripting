#!/bin/bash
# Budget calculator script
# This script calculates total expenses and savings based on user input
# It validates empty inputs and ensures only numeric values are entered
function lines {
        echo "*****************************************"
}

# color codes for error
RED='\033[1;31m'
NF='\033[0m'

# functions to check user input i.e. only positive numeric values
function total_income_check {
        [[ $total_income =~ ^[1-9][.0-9]*$ ]]
}
function rent_cost_check {
        [[ $rent_cost =~ ^[1-9][.0-9]*$ ]]
}
function transport_cost_check {
        [[ $transport_cost =~ ^[1-9][.0-9]*$ ]]
}
function groceries_cost_check {
        [[ $groceries_cost =~ ^[1-9][.0-9]*$ ]]
}
function utilities_cost_check {
        [[ $utilities_cost =~ ^[1-9][.0-9]*$ ]]
}
function extra_cost_check {
        [[ $extra_cost =~ ^[1-9][.0-9]*$ ]]
}

# warning
echo -e "${RED}Do not enter user input starting from zero${NF}"
sleep 0.2
# prompt user input
read -p "Enter the total income: " total_income
read -p "Enter the rent cost: " rent_cost
read -p "Enter the transport cost: " transport_cost
read -p "Enter the groceries cost: " groceries_cost
read -p "Enter the utilities cost such as phone, gas, electricity, internet bill: " utilities_cost
read -p "Enter the extra cost: " extra_cost

# user input empty
if [ -z "$total_income" ] || [ -z "$rent_cost" ] || [ -z "$transport_cost" ] || [ -z "$groceries_cost" ] || [ -z "$utilities_cost" ] || [ -z "$extra_cost" ]
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
        if [ -z "$transport_cost" ]
        then
                echo -e "${RED}User input --> Transport cost field is empty${NF}"
        fi
        if [ -z "$groceries_cost" ]
        then
                echo -e "${RED}User input --> Groceries cost field is empty${NF}"
        fi
        if [ -z "$utilities_cost" ]
        then
                echo -e "${RED}User input --> Utilities cost field is empty${NF}"
        fi
        if [ -z "$extra_cost" ]
        then
                echo -e "${RED}User input --> Extra cost field is empty${NF}"
        fi
# user input not empty
# validation check i.e. user input must contain only numeric values
# add all expenses and subtract from income
# display the results
else
        if ! total_income_check || ! rent_cost_check || ! transport_cost_check || ! groceries_cost_check || ! utilities_cost_check || ! extra_cost_check
        then
                lines
                if ! total_income_check
                then
                        echo -e "${RED}Total income field must contain numeric values"
                fi
                if ! rent_cost_check
                then
                        echo -e "${RED}Rent cost field must contain numeric values"
                fi
                if ! transport_cost_check
                then
                        echo -e "${RED}Transport cost field must contain numeric values"
                fi
                if ! groceries_cost_check
                then
                        echo -e "${RED}Groceries cost field must contain numeric values"
                fi
                if ! utilities_cost_check
                then
                        echo -e "${RED}Utilities cost field must contain numeric values"
                fi
                if ! extra_cost_check
                then
                        echo -e "${RED}Extra cost field must contain numeric values"
                fi
        else
                total_expenses=$(bc <<< "$rent_cost + $transport_cost + $groceries_cost + $utilities_cost + $extra_cost")
                echo "Total expenses --> $total_expenses"
                savings=$(bc <<< "$total_income - $total_expenses")

                if (( $(bc <<< "$savings > 0")))
                then
                        echo "Savings --> $savings"
                else
                        echo -e "${RED}No savings, OVERDRAFT --> $savings${NF}"
                fi
        fi
fi
