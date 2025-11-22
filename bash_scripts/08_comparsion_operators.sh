#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the second number"
read second

#Comparsion operators 
#-gt --> greater than, -ge greaer than equal to
#-lt -- less than, -le less than equal to 
# -eq --> eqaul to, -ne --> no equal to 

if [ $first -gt $second ]
then
        echo "First number:$first is greater than Second number:$second"
elif [ $first -lt $second ]
then
        echo "First number:$first is less than Second number:$second"
elif [ $first -eq $second ]
then
        echo "First number:$first is equal to Second number:$second"
fi
