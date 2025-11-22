#!/bin/bash

echo "Enter first name"
read first_name

#-z means user input is zero
if [ -z "$first_name" ]
then
        echo "User input is empty"
#-n --> user input length is greater than 0
elif [ -n "$first_name" ]
then
        echo "Hello, $first_name"

fi

#Compare two strings 
# two strings equal i.e. ==
if [ "$first_name" == "Hrishi" ]
then
        echo "Your name is Hrishi"
#Strings are not equal !=
elif [ "$first_name" != "Hrishi" ]
then
        echo "Your name is not Hrishi"
fi
