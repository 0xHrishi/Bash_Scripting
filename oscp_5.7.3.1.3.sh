#!/bin/bash

#########################################################################
# Description:
# This script accepts a file path as input and checks the following:
#   1. Whether the file path is empty.
#   2. Whether the path exists.
#   3. Whether it is a regular non-empty file.
#   4. If it is a valid file, the script searches for lines containing
#      the keyword "js" (case-insensitive), assuming they refer to
#      JavaScript file paths.
#########################################################################

# Function to print a separator line
function lines {
        echo "*************************************************************"
}

# Read user input for the file path
read -p "Enter the filepath: " filepath

# Check if filepath input is empty
if [ -z "$filepath" ]
then
        lines
        echo "User input -- Filepath field is empty"

# If user entered something
# Check if the path exists
# Check if it is a file and not empty, Extract JavaScript-related entries
elif [ -n "$filepath" ]
then
        if [ -e "$filepath" ]
        then
                if [ -f "$filepath" ] && [ -s "$filepath" ]
                then
                        cat $filepath | grep -i "js" | cut -d "/" -f5 | cut -d " " -f1 | sort | uniq
                elif [ -d "$filepath" ]
                then
                        lines
                        echo "$filepath -- Its a directory"
                else
                        lines
                        echo "$filepath -- Unable to identify the file type"
                fi
        else
                lines
                echo "$filepath -- File does not exist"
        fi
fi
