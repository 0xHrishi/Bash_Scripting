#!/bin/bash
# Description : Checks whether a given path exists, identifies if it is a file or directory,
# If file exists, display permissions
function lines {
        echo "*****************************************"
}

# color codes for error
RED='\033[1;31m'
NF='\033[0m'

# user prompt
read -p "Enter the file absolute path to display its permission: " filepath

# user input empty
if [ -z "$filepath" ]
then
        lines
        echo -e "${RED}User input --> File absoulte path field is empty${NF}"
# user input not empty
# check whether file/directory exist, if yes, displays its permission
else
        lines
        if [ -e $fileapth ]
        then
                if [ -f "$filepath" ]
                then
                        echo -e "${RED}Its a regular file${NF}"
                        if [ -r "$filepath" ]
                        then
                                echo "$filepath --> Read permission"
                        fi
                        if [ -w "$filepath" ]
                        then
                                echo "$filepath --> Write permission"
                        fi
                        if [ -x "$filepath" ]
                        then
                                echo "$filepath --> Execute permission"
                        fi
                elif [ -d "$filepath" ]
                then
                        echo -e "${RED}Its a directory${NF}"
                        if [ -r "$filepath" ]
                        then
                                echo "$filepath --> Read permission"
                        fi
                        if [ -w "$filepath" ]
                        then
                                echo "$filepath --> Write permission"
                        fi
                        if [ -x "$filepath" ]
                        then
                                echo "$filepath --> Execute permission"
                        fi
                else
                        echo -e "${RED}$filepath --> File found, but unable to identify the file type${NF}"
                fi
        else
                echo -e "${RED}$filepath --> File not found${NF}"

        fi
fi
