#!/bin/bash
# Identifies file type (regular file or directory)
# and displays read, write, and execute permissions
function lines {
        echo "****************************************************************"
}

# color codes for error messages
red='\033[0;31m'
nf='\033[0m'

# Prompt user input
read -p "Enter the file full path: " file_path

# User input field empty
if [ -z "$file_path" ]
then
        lines
        echo -e "${red}File path field is empty${nf}"

# User input is not empty
# Check if the file or directory exists
# Based upon file / directory, display permissions the user have 
elif [ -n "$file_path" ]
then
        lines
        if [ -e "$file_path" ]
        then
                if [ -f "$file_path" ]
                then
                        echo "$file_path --> Regular file"
                        if [ -r "$file_path" ]
                        then
                                echo "$file_path --> Got read permission"
                        fi
                        if [ -w "$file_path" ]
                        then
                                echo "$file_path --> Got write permission"
                        fi
                        if [ -x "$file_path" ]
                        then
                                echo "$file_path --> Got execute permission"
                        fi
                        if [ ! -r "$file_path" ] && [ ! -w "$file_path" ] && [ ! -x "$file_path" ]
                        then
                                echo "$file_path --> No red, write, execute permission"
                        fi
                elif [ -d "$file_path" ]
                then
                        echo "$file_path --> Directory"
                        if [ -r "$file_path" ]
                        then
                                echo "$file_path --> Got read permission"
                        fi
                        if [ -w "$file_path" ]
                        then
                                echo "$file_path --> Got write permission"
                        fi
                        if [ -x "$file_path" ]
                        then
                                echo "$file_path --> Got execute permission"
                        fi
                        if [ ! -r "$file_path" ] && [ ! -w "$file_path" ] && [ ! -x "$file_path" ]
                        then
                                echo "$file_path --> No red, write, execute permission"
                        fi
                else
                        echo -e "${red}$file_path -- File found, unable to identify the file type${nf}"
                fi
        else
                echo -e "${red}$file_path --> File not found${nf}"
        fi
fi
