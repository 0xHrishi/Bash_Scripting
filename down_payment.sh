#!/bin/bash
#script calculates down payment based upon the total cost of the house and credit score 
function lines {
        echo "*********************************************"
}

#user input
read -p "Enter total cost of the house: " total_cost
read -p "Enter the credit score: " credit_score

#function to check whether the user input must contain only numeric values
function total_cost_integer {
        [[ $total_cost =~ ^[0-9]+$ ]]
}
function total_cost_integer_wrong {
        [[ ! $total_cost =~ ^[0-9]+$ ]]
}
function credit_score_integer {
        [[ $credit_score =~ ^[0-9]+$ ]]
}
function credit_score_integer_wrong {
        [[ ! $credit_score =~ ^[0-9]+$ ]]
}

#user input empty
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

#user input not empty
#condition to eheck whether user input contain only numeric values
# based upon the credit score and total cost of the house, the down payment is calculated

elif [ -n "$total_cost" ] && [ -n "$credit_score" ]
then
        if total_cost_integer_wrong || credit_score_integer_wrong
        then
                if total_cost_integer && credit_score_integer_wrong
                then
                        lines
                        echo "Credit score field must contain numric values"
                elif total_cost_integer_wrong && credit_score_integer
                then
                        lines
                        echo "Total cost of the house field must contain numric values"
                elif total_cost_integer_wrong && credit_score_integer_wrong
                then
                        lines
                        echo "Total cost of the house field must contain numric values"
                        echo "Credit score field must contain numric values"
                fi
        elif total_cost_integer && credit_score_integer
        then
                if [ $credit_score -ge 1000 ]
                then
                        lines
                        echo "Credit score cannot be greater than or equal to 1000"
                elif [ $credit_score -le 999 ]
                then
                        if [ $credit_score -ge 750 ]
                        then
                                lines
                                echo "Total cost of the house -->$total_cost"
                                echo "Credit score -->$credit_score"
                                down_payment=$(($total_cost*10/100))
                                echo "Down payment --> $down_payment"
                        elif [ $credit_score -ge 650 ] && [ $credit_score -le 749 ]
                        then
                                lines
                                echo "Total cost of the house -->$total_cost"
                                echo "Credit score -->$credit_score"
                                down_payment=$(($total_cost*20/100))
                                echo "Down payment --> $down_payment"
                        elif [ $credit_score -ge 600 ] && [ $credit_score -le 649 ]
                        then
                                lines
                                echo "Total cost of the house -->$total_cost"
                                echo "Credit score -->$credit_score"
                                down_payment=$(($total_cost*30/100))
                                echo "Down payment --> $down_payment"
                        else
                                lines
                                echo "Sorry, cannot proceed with application"
                        fi
                fi
        fi
fi

