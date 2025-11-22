#!/bin/bash

#non parameterized functions i.e. just display the output
function lines {
        echo "**************************************"
}

#parameterized functions i.e. take input from the user
read -p "Enter the first number: " first
read -p "Enter the second number: " second

#parameterized functions i.e. take input from the user
function add {
        sum=$(($1+$2))
        echo "$1 plus $2 --> $sum"
}

add $first $second


function addition {
        result=$(($1+$2))
        echo "$1 plus $2 --> $result"
}

addition 10 15
