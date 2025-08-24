#!/bin/bash

#In bash script there are two methods to create a function and it depends upon the user preference 
#First method 
function print_lines {
        echo "*************************************"
}

print_lines

#second method
lines(){
        echo "*************************************"
}

lines

#Functions with arguments 
function add {
        num1=$1
        num2=$2
        sum=$(($num1+$num2))
        echo "$num1 plus $num2 --> $sum"
}

add 15 20

#function with arguments
echo "Enter first number"
read first_number
echo "Enter second number"
read second_number

function addition {
        sum=$(($1+$2))
        echo "$sum"
}

addition $first_number $second_number
