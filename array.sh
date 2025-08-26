#!/bin/bash

#Declare a variable called array_1
#In bash scripting, all the values are consider as string 
array_1=("a" "b" "c" "d" 35)

#print all the values inside array
echo "${array_1[@]}"
#retirve the array as per the index value. Index starts from 0
echo "${array_1[0]}"
#Array slicing 
echo "${array_1[@]:0:4}"

#Add a new value i.e. append 
array_1+=(36 37)
echo "${array_1[@]}"

#add a new value as per index
array_1[0]=(40)
echo "${array_1[@]}"
#Replace an existing value with new value as per the index
array_1[0]=39
echo "${array_1[@]}"

#Insert values into a array via user input
echo "Enter the number"
read number

array_1+=("$number")
echo "${array_1[@]}"

#remove values from an array based upon the index position
unset array_1[0]
echo "${array_1[@]}"

