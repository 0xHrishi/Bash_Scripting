#!/bin/bash

#scrit to check the down payment when total cost of the house and credit score is entered 

#user input i.e. total cost of the house and credit score
echo "Enter the total cost of the house"
read total
echo "Enter the credit score"
read credit


function lines {
        echo "************************************"
}

#function to check that total cost of the house and credit score field must contain only numeric values
function total_right {
        [[ $total =~ ^[0-9]+$ ]]
}
function total_wrong {
        [[ ! $total =~ ^[0-9]+$ ]]
}
function credit_right {
        [[ $credit =~ ^[0-9]{1,3}$ ]]
}
function credit_wrong {
        [[ ! $credit =~ ^[0-9]{1,3} ]]
}

#check user input
if [ -z "$total" ] || [ -z "$credit" ]
then
        if [ -n "$total" ] && [ -z "$credit" ]
        then
                lines
                echo "Credit score field is empty"
        elif [ -z "$total" ] && [ -n "$credit" ]
        then
                lines
                echo "Total cost of the house field is empty"
        elif [ -z "$total" ] && [ -z "$credit" ]
        then
                lines
                echo "Total cost of the house field is empty"
                echo "Credit score field is empty"
        else
                lines
                echo "Issues with the user input"
        fi

#User input is not empty
elif [ -n "$total" ] && [ -n "$credit" ]
then
        #check whether the total cost of the house and credit score field contain only numeric values
        if total_wrong || credit_wrong
        then
                if total_right && credit_wrong
                then
                        lines
                        echo "Credit score field must contain only numeric values"
                elif total_wrong && credit_right
                then
                        lines
                        echo "Total cost of the house field must contain only numeric values"
                elif total_wrong && credit_wrong
                then
                        lines
                        echo "Total cost of the house field must contain only numeric values"
                        echo "Credit score field must contain only numeric values"
                else
                        lines
                        echo "Issues with the user input"
                fi

        #user input contain only numeric values
        #perform calculation based upon the credit score
        elif total_right && credit_right
        then
                if [ $credit -ge 1000 ]
                then
                        lines
                        echo "Credit score cannot be greather than or equal to 1000"
                elif [ $credit -ge 750 ]
                then
                        lines
                        down_payment=$(($total*10/100))
                        echo "Total cost of the house --> $total"
                        echo "Credit score --> $credit"
                        echo "Down payment --> $down_payment"
                elif [ $credit -ge 650 ] && [ $credit -le 749 ]
                then
                        lines
                        down_payment=$(($total*20/100))
                        echo "Total cost of the house --> $total"
                        echo "Credit score --> $credit"
                        echo "Down payment --> $down_payment"
                elif [ $credit -ge 600 ] && [ $credit -le 649 ]
                then
                        lines
                        down_payment=$(($total*30/100))
                        echo "Total cost of the house --> $total"
                        echo "Credit score --> $credit"
                        echo "Down payment --> $down_payment"
                else
                        lines
                        echo "Cannot proceed with the application"
                fi
        fi
fi
