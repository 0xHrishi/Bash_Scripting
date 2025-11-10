#!/bin/bash

# Find files in a given path modified within a specific number of days

function lines {
        echo "******************************************************************************"
}

# Function to check the number of days field must contain only numeric values
function days_check {
        [[ $days =~ ^[0-9-]+$ ]]
}

#user input
read -p "Enter the path: " filepath
read -p "Enter the number of days: " days

# Check if the user left any field empty
if [ -z "$filepath" ] || [ -z "$days" ]
then
        if [ -n "$filepath" ] && [ -z "$days" ]
        then
                lines
                echo "User input --> Number of days is empty"
        elif [ -z "$filepath" ] && [ -n "$days" ]
        then
                lines
                echo "User input --> Fileapth field is empty"
        elif [ -z "$filepath" ] && [ -z "$days" ]
        then
                lines
                echo "User input --> Fileapth field is empty"
                echo "User input --> Number of days is empty"
        fi

# Both inputs are provided, validate 'days' field
# Number of days field, check it must contain only numeric values

elif [ -n "$filepath" ] && [ -n "$days" ]
then
        if ! days_check
        then
                lines
                echo "Number of days field must contain only numeric values"
        elif days_check
        then
                find $filepath -mtime $days -exec ls -l {} \; 2>/dev/null
        fi
fi
