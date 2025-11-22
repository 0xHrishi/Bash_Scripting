#!/bin/bash

number_1=1

#loop will keep on executing until the condition turn false 
#loop will keep on executing until the number is less than 10, so it will run til 9
#((number_1++)) --> increment by 1
while [ $number_1 -lt 10 ]
do
        echo "$number_1"
        ((number_1++))
done
