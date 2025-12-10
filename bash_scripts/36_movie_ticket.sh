#!/bin/bash
# -------------------------------------------------------------
# Ticket Price Discount Script
# -------------------------------------------------------------
# This script calculates the final payable amount for a ticket
# based on:
#   - Ticket cost entered by the user
#   - User's age
#   - Whether the user has a loyalty card (YES / NO)

function lines {
        echo "*************************************************************"

}

# prompt user input
read -p "Enter the ticket price: " ticket_cost
read -p "Enter your age: " age
read -p "Do you have a loyalty card yes or no?: " loyalty_card

# Validate user input such as ticket_cost and age must be numeric values only
# Loyalty card user input must accept only YES OR NO
function ticket_cost_check {
        [[ $ticket_cost =~ ^[1-9][0-9]*$ ]]
}
function age_check {
        [[ $age =~ ^[1-9][0-9]*$ ]]
}

function loyalty_card_check {
        [[ $loyalty_card =~ [YESNO] ]]
}

# User input empty
if [ -z "$ticket_cost" ] || [ -z "$age" ] || [ -z "$loyalty_card" ]
then
        if [ -n "$ticket_cost" ] && [ -z "$age" ] && [ -z "$loyalty_card" ]
        then
                lines
                echo "User input --> Age field is empty"
                echo "User input --> Loyalty card field is empty"
        elif [ -n "$ticket_cost" ] && [ -n "$age" ] && [ -z "$loyalty_card" ]
        then
                lines
                echo "User input --> Loyalty card field is empty"
        elif [ -n "$ticket_cost" ] && [ -z "$age" ] && [ -n "$loyalty_card" ]
        then
                lines
                echo "User input --> Age field is empty"
        elif [ -z "$ticket_cost" ] && [ -n "$age" ] && [ -n "$loyalty_card" ]
        then
                lines
                echo "User input --> Ticket cost field is empty"
        elif [ -z "$ticket_cost" ] && [ -z "$age" ] && [ -n "$loyalty_card" ]
        then
                lines
                echo "User input --> Ticket cost field is empty"
                echo "User input --> Age field is empty"
        elif [ -z "$ticket_cost" ] && [ -n "$age" ] && [ -z "$loyalty_card" ]
        then
                lines
                echo "User input --> Ticket cost field is empty"
                echo "User input --> Loyalty card field is empty"
        elif [ -z "$ticket_cost" ] && [ -z "$age" ] && [ -z "$loyalty_card" ]
        then
                lines
                echo "User input --> Ticket cost field is empty"
                echo "User input --> Age cost field is empty"
                echo "User input --> Loyalty card field is empty"
        fi

# User input not empty
# Validate user input 
# Calculate the ticket price based upon the ticket price, age and loyalty card
elif [ -n "$ticket_cost" ] && [ -n "$age" ] && [ -n "$loyalty_card" ]
then
        if ! ticket_cost_check || ! age_check
        then
                if  ticket_cost_check && ! age_check
                then
                        lines
                        echo "Age field must contain only numeric values"
                elif  ! ticket_cost_check && age_check
                then
                        lines
                        echo "Ticket cost field must contain only numeric values"
                elif  ! ticket_cost_check && ! age_check
                then
                        lines
                        echo "Ticket cost field must contain only numeric values"
                        echo "Age field must contain only numeric values"
                fi

        elif ticket_cost_check && age_check
        then
                if ! loyalty_card_check
                then
                        lines
                        echo "User input -- Loyalty card only accept YES or NO"
                elif loyalty_card_check
                then
                        if [ "$loyalty_card" == "YES" ]
                        then
                                if [ $age -ge 75 ]
                                then
                                        lines
                                        discount=$((25*$ticket_cost/100))
                                        final_amount=$(($ticket_cost-$discount))
                                        echo "Ticket cost -> $ticket_cost"
                                        echo "Senior Citizen discount 20%"
                                        echo "Loyalty card discount 5%"
                                        echo "Discount --> $discount"
                                        echo "Amount to be paid --> $final_amount"
                                elif [ $age -ge 60 ] && [ $age -le 74 ]
                                then
                                        lines
                                        discount=$((20*$ticket_cost/100))
                                        final_amount=$(($ticket_cost-$discount))
                                        echo "Ticket cost -> $ticket_cost"
                                        echo "Senior Citizen discount 15%"
                                        echo "Loyalty card discount 5%"
                                        echo "Discount --> $discount"
                                        echo "Amount to be paid --> $final_amount"
                                elif [ $age -ge 1 ] && [ $age -le 59 ]
                                then
                                        lines
                                        discount=$((5*$ticket_cost/100))
                                        final_amount=$(($ticket_cost-$discount))
                                        echo "Ticket cost -> $ticket_cost"
                                        echo "Loyalty card discount 5%"
                                        echo "Discount --> $discount"
                                        echo "Amount to be paid --> $final_amount"
                                fi
                        elif [ "$loyalty_card" == "NO" ]
                        then
                                if [ $age -ge 75 ]
                                then
                                        lines
                                        discount=$((20*$ticket_cost/100))
                                        final_amount=$(($ticket_cost-$discount))
                                        echo "Ticket cost -> $ticket_cost"
                                        echo "Senior Citizen discount 20%"
                                        echo "Discount --> $discount"
                                        echo "Amount to be paid --> $final_amount"
                                elif [ $age -ge 60 ] && [ $age -le 74 ]
                                then
                                        lines
                                        discount=$((15*$ticket_cost/100))
                                        final_amount=$(($ticket_cost-$discount))
                                        echo "Ticket cost -> $ticket_cost"
                                        echo "Senior Citizen discount 15%"
                                        echo "Discount --> $discount"
                                        echo "Amount to be paid --> $final_amount"
                                elif [ $age -ge 1 ] && [ $age -le 59 ]
                                then
                                        lines
                                        echo "Ticket cost -> $ticket_cost"
                                        echo "Amount to be paid --> $ticket_cost"
                                fi
                        fi
                fi

        fi
fi
