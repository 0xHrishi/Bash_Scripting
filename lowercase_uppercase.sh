#!/bin/bash
#script helps to check whether user input is upper or in lower case 

echo "Enter your name"
read name

#condition to check userinput is in lowercase
if [ "$name" == "${name,,}" ]
then
        echo "Your name: $name in lower case"
#condition to check user input is in uppercase
elif [ "$name" == "${name^^}" ]
then
        echo "Your name: $name in upper case"
fi

#condition to check whether the first word in user input is capital  
if [ "$name" == "${name^}" ]
then
        echo "First letter in name is capitalize"
else
        echo "First letter in name is not capitalize"
fi
