#!/bin/bash

# This script asks the user to enter their full name and displays its length.

function lines {
        echo "**************************************************"
}

# Prompt user for their full name
echo "Enter your full name"
read name

# Check if the input is empty or not
# Provides the length of the string -- ${#name} 

if [ ${#name} -eq 0 ]
then
        lines
        echo "User input --> Name field is empty"
elif [ ${#name} -gt 0 ]
then
        lines
        echo "Your full name is --> $name"
        echo "Length --> ${#name}"
fi
