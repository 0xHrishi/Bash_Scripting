#!/bin/bash
# ------------------------------------------------------------
# Monthly Savings Calculator
# ------------------------------------------------------------
# This script:
# 1. Takes monthly income and expense inputs from the user
# 2. Validates empty inputs
# 3. Validates numeric inputs (supports decimal values)
# 4. Calculates total expenses and savings using `bc`
# 5. Displays savings in red if the value is negative
# ------------------------------------------------------------
function lines {
        echo "***************************************************************"
}

# color codes for error messages
RED='\033[0;31m'
NF='\033[0m'

# function to validate user input
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

# User input
read -p "Enter the total income: " total_income
read -p "Enter the rent cost: " rent_cost
read -p "Enter the groceries cost: " groceries_cost
read -p "Enter the transport cost: " transport_cost
read -p "Enter the utilities cost such as power, gas, electricity bill: " utilities_cost
read -p "Extra cost: " extra_cost

# Empty input validation
if [ -z "$total_income" ] || [ -z "$rent_cost" ] || [ -z "$groceries_cost" ] || [ -z "$transport_cost" ] || [ -z "$utilities_cost" ] || [ -z "$extra_cost" ]
then
        lines
        if [ -z "$total_income" ]
        then
                echo -e "${RED}User input --> Total income filed is empty${NF}"
        fi
        if [ -z "$rent_cost" ]
        then
                echo -e "${RED}User input --> Rent cost filed is empty${NF}"
        fi
        if [ -z "$groceries_cost" ]
        then
                echo -e "${RED}User input --> Groceries cost filed is empty${NF}"
        fi
        if [ -z "$transport_cost" ]
        then
                echo -e "${RED}User input --> Transport cost filed is empty${NF}"
        fi
        if [ -z "$utilities_cost" ]
        then
                echo -e "${RED}User input --> Utilities cost filed is empty${NF}"
        fi
        if [ -z "$extra_cost" ]
        then
                echo -e "${RED}User input --> Extra cost filed is empty${NF}"
        fi

# user input not empty
# user input validation 
# Calculate total expenses using bc (supports decimals)
# Calculate savings
# Display savings (red if negative)

elif [ -n "$total_income" ] && [ -n "$rent_cost" ] && [ -n "$groceries_cost" ] && [ -n "$transport_cost" ] && [ -n "$utilities_cost" ] && [ -n "$extra_cost" ]
then
        if ! total_income_check || ! rent_cost_check || ! groceries_cost_check || ! transport_cost_check || ! utilities_cost_check || ! extra_cost_check
        then
                lines
                if ! total_income_check
                then
                        echo -e "${RED}Total income field must contain numeric values${NF}"
                fi
                if ! rent_cost_check
                then
                        echo -e "${RED}Rent cost field must contain numeric values${NF}"
                fi
                if ! groceries_cost_check
                then
                        echo -e "${RED}Groceries cost field must contain numeric values${NF}"
                fi
                if ! transport_cost_check
                then
                        echo -e "${RED}Transport cost field must contain numeric values${NF}"
                fi
                if ! utilities_cost_check
                then
                        echo -e "${RED}Utilities cost field must contain numeric values${NF}"
                fi
                if ! extra_cost_check
                then
                        echo -e "${RED}Extra cost field must contain numeric values${NF}"
                fi
        elif total_income_check && rent_cost_check
        then
                lines
                total_cost=$(bc <<< "$rent_cost + $groceries_cost + $transport_cost + $utilities_cost + $extra_cost")
                savings=$(bc <<< "$total_income - $total_cost")
                echo "Total income --> $total_income"
                echo "Rent cost --> $rent_cost"
                if (( $(bc <<< "$savings >= 0") ))
                then
                        echo "Savings --> $savings"
                else
                        echo -e "${RED}Savings --> $savings${NF}"
                fi
        fi
fi
