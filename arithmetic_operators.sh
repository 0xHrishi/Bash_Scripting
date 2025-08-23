#!/bin/bash
#bash script for arithmetic operators 
echo "Enter the first number"
read first
echo "Enter the second number"
read second

#arithmetic operators such as addition +, subtraction -, multiplication *, power **
#Quotient /, remainder %
add=$(($first+$second))
sub=$(($first-$second))
multiply=$(($first*$second))
power=$(($first**$second))
divide_quotient=$(($first/$second))
divide_remainder=$(($first%$second))

echo "First number:$first plus Second number:$second --> $add"
echo "First number:$first subtract Second number:$second --> $sub"
echo "First number:$first multiply Second number:$second --> $multiply"
echo "First number:$first power Second number:$second --> $power"
echo "First number:$first divide (Quotient) Second number:$second --> $divide_quotient"
echo "First number:$first divide (Remainder) Second number:$second --> $divide_remainder"
