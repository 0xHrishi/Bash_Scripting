#!/bin/bash

#script to check the down payment require i.e. first enter total cost of the house and based upon the credit score, display down payment amount 

#User input --> Total cost of the house
echo "Enter the total cost of the house"
read total_cost

#User input --> Credit score 
echo "Enter the credit score"
read credit_score

function lines {
        echo "**************************************"
}

#function to make sure thr total cost of the house field must contain only numeric values
function total_cost_right {
        [[ $total_cost =~ ^[0-9]+$ ]]
}
function total_cost_wrong {
        [[ ! $total_cost =~ ^[0-9]+$ ]]
}

#function to make sure the credit score must contain only numeric values
function credit_score_right {
        [[ $credit_score =~ ^[0-9]+$ ]]
}
function credit_score_wrong {
        [[ ! $credit_score =~ ^[0-9]+$ ]]
}

#User input if empty or the string length is equal to zero
if [ -z "$total_cost" ] || [ -z "$credit_score" ]
then
        if [ -n "$total_cost" ] && [ -z "$credit_score" ]
        then
                lines
                echo "Credit score field is empty"
        elif [ -z "$total_cost" ] && [ -n "$credit_score" ]
        then
                lines
                echo "Total cost of the house field is empty"
        elif [ -z "$total_cost" ] && [ -z "$credit_score" ]
        then
                lines
                echo "Total cost of the house field is empty"
                echo "Credit score field is empty"
        else
                lines
                echo "Issues with the user input"
        fi

#user input valid 
elif [ -n "$total_cost" ] && [ -n "$credit_score" ]
then
        #check whether the user input ie.. total cost and credit score contain only numric values or not 
        if total_cost_wrong || credit_score_wrong
        then
                if total_cost_right && credit_score_wrong
                then
                        lines
                        echo "Credit score field must contain only numeric values"
                elif total_cost_wrong && credit_score_right
                then
                        lines
                        echo "Total cost of the house field must contain only numeric values"
                elif total_cost_wrong && credit_score_wrong
                then
                        lines
                        echo "Credit score field must contain only numeric values"
                        echo "Total cost of the house field must contain only numeric values"
                else
                        lines
                        echo "Issues with the user input validation"
                fi

        #User input contain only numeric values
        elif total_cost_right && credit_score_right
        then
                if [ $credit_score -gt 999 ]
                then
                        lines
                        echo "Credit score i.e. $credit_score cannot be greather than 999"
                elif [ $credit_score -lt 999 ]
                then
                        #perform and display the down payment based upon the total cost of the house and credit score
                        if [ $credit_score -le 599 ]
                        then
                                lines
                                echo "Cannot proceed the application for now"
                        elif [ $credit_score -le 649 ] || [ $credit_score -eq 600 ]
                        then
                                lines
                                echo "Total cost of the house --> $total_cost"
                                echo "Credit score --> $credit_score"
                                down_payment=$(($total_cost*30/100))
                                echo "Down payment require --> $down_payment"
                        elif [ $credit_score -le 749 ] || [ $credit_score -eq 650 ]
                        then
                                lines
                                echo "Total cost of the house --> $total_cost"
                                echo "Credit score --> $credit_score"
                                down_payment=$(($total_cost*20/100))
                                echo "Down payment require --> $down_payment"
                        elif [ $credit_score -ge 750 ]
                        then
                                lines
                                echo "Total cost of the house --> $total_cost"
                                echo "Credit score --> $credit_score"
                                down_payment=$(($total_cost*10/100))
                                echo "Down payment require --> $down_payment"
                        fi
                else
                        lines
                        echo "SOmething went wrong while checking"
                fi
        fi

fi
