#!/bin/bash

# This script reads the user's full name, checks if it's in lowercase or uppercase, and converts it to the opposite case.

function lines {
        echo "**************************************************"
}

# Prompt the user for input
echo "Enter your full name in lower or upper case"
read name

# Check if the user entered something
if [ -z "$name" ]
then
        lines
        echo "User input -- Name field is empty"

# User input not empty 
# Compare input with its lowercase version
# Compare input with its uppercase version

elif [ -n "$name" ]
then
        if [ "$name" == "${name,,}" ]
        then
                lines
                echo "Your name in lower case -- $name"
                echo "Lets convert to uppercase -- ${name^^}"
        elif [ "$name" == "${name^^}" ]
        then
                lines
                echo "Your name in upper case -- $name"
                echo "Lets convert to lowercase -- ${name,,}"
        fi

fi

