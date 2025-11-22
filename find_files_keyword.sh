#!/bin/bash
###########################################################################
# This script accepts a file's absolute path and a keyword from the user.
# It performs multiple validations:
#     - Ensures both inputs are provided.
#     - Checks if the file/directory exists.
#     - Detects whether the path is a directory or a file.
#     - Ensures the file is not empty.
#     - Searches the file for the given keyword (case-insensitive).
###########################################################################

# Function to print a separator line for cleaner output
function lines {
        echo "*************************************************************"
}

# Taking user input (file absolute path and keyword)
read -p "Enter the file absolute path: " filepath
read -p "Enter the keyword: " keyword

# ----------------------------- INPUT VALIDATION -----------------------------
if [ -z "$filepath" ] || [ -z "$keyword" ]
then
        if [ -n "$filepath" ] && [ -z "$keyword" ]
        then
                lines
                echo "User input -- Keyword field is empty"
        elif [ -z "$filepath" ] && [ -n "$keyword" ]
        then
                lines
                echo "User input -- Filepath field is empty"
        elif [ -z "$filepath" ] && [ -z "$keyword" ]
        then
                lines
                echo "User input -- Filepath field is empty"
                echo "User input -- Keyword field is empty"
        fi
        
# ------------------------- PROCESSING VALID INPUTS --------------------------
# If file exist and its not empty, Perform case-insensitive keyword search

elif [ -n "$filepath" ] &&[ -n "$keyword" ]
then
        if [ -e "$filepath" ]
        then
                if [ -d "$filepath" ]
                then
                        lines
                        echo "$filepath -- Its a directory"
                elif [ -f "$filepath" ]
                then
                        if [ -s "$filepath" ]
                        then
                                lines
                                cat $filepath | grep -i "$keyword"
                        elif [ ! -s "$filepath" ]
                        then
                                lines
                                echo "$filepath -- File exists, but its empty"
                        fi
                fi
        else
                lines
                echo "$filepath -- File not found"
        fi
fi
