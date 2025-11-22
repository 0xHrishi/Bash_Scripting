#!/bin/bash

# Checks whether the given file path exists, identifies if it's a file or directory, and displays its permissions.

# Function to print a separator line for clarity
function lines {
        echo "******************************************************************************"
}

# User prompt to enter the file name and its path
echo "Enter the filepath"
read filepath

# If user input is empty
if [ -z "$filepath" ]
then
        lines
        echo "User input --> Filepath field is empty"

# If user entered a non-empty string
# If file or directory exists, check and display its permissions
elif [ -n "$filepath" ]
then
        if [ -e "$filepath" ]
        then
                if [ -f "$filepath" ]
                then
                        lines
                        echo "$filepath -- Regular file"
                        if [ ! -r "$filepath" ] && [ ! -w "$filepath" ] && [ ! -x "$filepath" ]
                        then
                                echo "No Read, Write and Execute permissions"
                        elif [ ! -r "$filepath" ] && [ ! -w "$filepath" ] && [ -x "$filepath" ]
                        then
                                echo "No Read and Write permissions"
                                echo "Execute permission"
                        elif [ ! -r "$filepath" ] && [ -w "$filepath" ] && [ ! -x "$filepath" ]
                        then
                                echo "No Read and Execute permissions"
                                echo "Write permission"
                        elif [ ! -r "$filepath" ] && [ -w "$filepath" ] && [ -x "$filepath" ]
                        then
                                echo "No Read permissions"
                                echo "Write and Execute permissions"
                        elif [ -r "$filepath" ] && [ ! -w "$filepath" ] && [ ! -x "$filepath" ]
                        then
                                echo "No Write and Execute permissions"
                                echo "Read permission"
                        elif [ -r "$filepath" ] && [ ! -w "$filepath" ] && [ -x "$filepath" ]
                        then
                                echo "No Write permission"
                                echo "Read and Execute permissions"
                        elif [ -r "$filepath" ] && [ -w "$filepath" ] && [ ! -x "$filepath" ]
                        then
                                echo "No Execute permission"
                                echo "Read and Write permissions"
                        elif [ -r "$filepath" ] && [ -w "$filepath" ] && [ -x "$filepath" ]
                        then
                                echo "Read, Write and Execute permissions"
                        fi
                elif [ -d "$filepath" ]
                then
                        lines
                        echo "$filepath -- Directory"
                        if [ ! -r "$filepath" ] && [ ! -w "$filepath" ] && [ ! -x "$filepath" ]
                        then
                                echo "No Read, Write and Execute permissions"
                        elif [ ! -r "$filepath" ] && [ ! -w "$filepath" ] && [ -x "$filepath" ]
                        then
                                echo "No Read and Write permissions"
                                echo "Execute permission"
                        elif [ ! -r "$filepath" ] && [ -w "$filepath" ] && [ ! -x "$filepath" ]
                        then
                                echo "No Read and Execute permissions"
                                echo "Write permission"
                        elif [ ! -r "$filepath" ] && [ -w "$filepath" ] && [ -x "$filepath" ]
                        then
                                echo "No Read permission"
                                echo "Write and Execute permissions"
                        elif [ -r "$filepath" ] && [ ! -w "$filepath" ] && [ ! -x "$filepath" ]
                        then
                                echo "No Write and Execute permissions"
                                echo "Read permission"
                        elif [ -r "$filepath" ] && [ ! -w "$filepath" ] && [ -x "$filepath" ]
                        then
                                echo "No Write permission"
                                echo "Read and Execute permissions"
                        elif [ -r "$filepath" ] && [ -w "$filepath" ] && [ ! -x "$filepath" ]
                        then
                                echo "No Execute permission"
                                echo "Read and Write permissions"
                        elif [ -r "$filepath" ] && [ -w "$filepath" ] && [ -x "$filepath" ]
                        then
                                echo "Read, Write and Execute permissions"
                        fi
                fi
        else
                lines
                echo "$filepath --> File not found"
        fi
fi
