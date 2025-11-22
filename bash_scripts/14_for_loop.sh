#!/bin/bash
#loops are used for to perform repetative actions

number_1=1
number_2=10

#user create a variable i.e. numbers and there will be list of items.
#When it comes to execution, first item from the listwill get assigned to the variable and loop will execute the code between do and done
for numbers in $(seq $number_1 $number_2)
do
        echo $numbers
done

#Display the usernames 
filename=/etc/passwd

for usernames in $(cat $filename|cut -d ":" -f1)
do
        echo $usernames
done
