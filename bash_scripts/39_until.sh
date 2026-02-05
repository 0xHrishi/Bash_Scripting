#!/bin/bash
# User specifies a condition, untill and unless the condition is false, the loop will keep on executing
# Once the condition is true, the loop exists. 
# opposite to while loop

a=10
number=0
until [ $number -eq $a ]
do
        echo "Number --> $number"
        ((number++))

done
