#file test operators
#-f --> file exist and its a regular file
#-d --> file exist and its a directory
#-s --> file exist, its a file or directory and the size of it its greater than 0 
# -e --> file exist and it can be a directory or regular file

#!/bin/bash

echo "Enter the file path"
read file_path

if [ -s $filepath ]
then
        if [ -d $file_path ]
        then
                echo "$file_path --> its a directory"
        elif [ -f $file_path ]
        then
                echo "$file_path --> its a file"
        else
                echo "$file_path --> Unable to identify the filepath"
        fi
else
        echo "$file_path not found"
fi
