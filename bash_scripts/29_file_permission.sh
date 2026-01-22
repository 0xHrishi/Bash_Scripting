#!/bin/bash

# Description : 
#   This script checks whether a given filepath exists.
#   If it exists, it identifies whether it is a directory
#   or a regular file and displays its read, write, and
#   execute permissions.

function lines {
        echo "***************************************************************"
}

# color codes for error messages
RED='\033[0;31m'
NF='\033[0m'

# user iput
read -p "Enter the filepath: " filepath

# user input empty
if [ -z "$filepath" ]
then
        lines
        echo -e "${RED}User input --> Filepath field is empty${NF}"

# user input not empty
# Check if the path exists
# File/Directory found --- based upon that display permissions
else
        lines
        if [ -e "$filepath" ]
        then
                if [ -d "$filepath" ]
                then
                        echo -e "${RED}Its a directory${NF}"
                        if [ -r "$filepath" ]
                        then
                                echo "Read permission"
                        fi
                        if [ -w "$filepath" ]
                        then
                                echo "Write permission"
                        fi
                        if [ -x "$filepath" ]
                        then
                                echo "Execute permission"
                        fi
                        if [ ! -r "$filepath" ]
                        then
                                echo "No Read permission"
                        fi
                        if [ ! -w "$filepath" ]
                        then
                                echo "No Write permission"
                        fi
                        if [ ! -x "$filepath" ]
                        then
                                echo "No Execute permission"
                        fi
                elif [ -f "$filepath" ]
                then
                        echo -e "${RED}Its a regular file${NF}"
                        if [ -r "$filepath" ]
                        then
                                echo "Read permission"
                        fi
                        if [ -w "$filepath" ]
                        then
                                echo "Write permission"
                        fi
                        if [ -x "$filepath" ]
                        then
                                echo "Execute permission"
                        fi
                        if [ ! -r "$filepath" ]
                        then
                                echo "No Read permission"
                        fi
                        if [ ! -w "$filepath" ]
                        then
                                echo "No Write permission"
                        fi
                        if [ ! -x "$filepath" ]
                        then
                                echo "No Execute permission"
                        fi
                else
                        echo "$filepath --> File found, but unable to identify the filepath"
                fi
        else
                echo -e "${RED}File not found${NF}"
        fi
fi
