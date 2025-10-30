#!/bin/bash
# -------------------------------------------------------------------
# Script Name : check_js_files.sh
# Description : Checks whether a given input is a file or directory,
#               and if it's a file, searches for '.js' entries inside.
# -------------------------------------------------------------------

# Prompt the user for file or directory path
#!/bin/bash

read -p "Enter the file location: " file

# Function to print a separator line
function lines {
        echo "**********************************************"
}

#Check user input
if [ -z "$file" ]
then
        lines
        echo "File location field is empty"

# User input not empty
# Check if the file or directory exists
# If it's a non-empty regular file, search for JavaScript files

elif [ -n "$file" ]
then
        if [ -e "$file" ]
        then
                if [ -d "$file" ]
                then
                        lines
                        echo "$file -- Its a directory"
                elif [ -f "$file" ] && [ -s "$file" ]
                then
                        echo "Looking for JavaScript files wih .js extension"
                        cat $file | grep -wi "js" | cut -d "/" -f5 | cut -d " " -f1 | sort | uniq
                fi
        else
                lines
                echo "$file --> File not found"
        fi

fi
