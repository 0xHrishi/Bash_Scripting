#!/bin/bash

#script check for a keyword as per the user choice 

function lines {
        echo "**************************************"
}

#function for keyword search inside a file
function keyword-search {
        cat $filepath | grep -i $keyword &>/dev/null
        if [ $? -eq 0 ]
        then
                lines
                cat $filepath | grep --color=always -ni $keyword
                try_again
        else
                lines
                echo "$filepath --> Filename"
                echo "$keyword --> Keyword"
                echo "No Keyword:$keyword found in file:$filepath"
                try_again
        fi
}

#function to try again with a new keyword
function try_again {
        echo "Would you like to try again the search with a different keyword ? y/n"
        read option
        if [ "$option" == "n" ]
        then
                lines
                echo "You choose to quit"
        elif [ "$option" == "y" ]
        then
                read -p "Enter the keyword: " keyword
                keyword-search
        else
                lines
                echo "Invalid user input"
        fi

}

#user input
read -p "Enter the full file path: " filepath
read -p "Enter the keyword: " keyword

#check user input field
if [ -z "$filepath" ] || [ -z "$keyword" ]
then
        if [ -n "$filepath" ] && [ -z "$keyword" ]
        then
                echo "User input --> Keyword field is empty"
        elif [ -z "$filepath" ] && [ -n "$keyword" ]
        then
                lines
                echo "User input --> File path field is empty"
        elif [ -z "$filepath" ] && [ -z "$keyword" ]
        then
                lines
                echo "User input --> File path field is empty"
                echo "User input --> Keyword field is empty"
        fi

#user input checked
elif [ -n "$filepath" ] && [ -n "$keyword" ]
then
        if [ -e $filepath ]
        then
                if [ -d $filepath ]
                then
                        lines
                        echo "$filepath --> its a directory"
                        echo "Nothing can be done"
                elif [ -f $filepath ] && [ -s $filepath ]
                then
                        keyword-search
                else
                        lines
                        echo "$filepath found"
                        echo "Unable to identify the file path"
                fi
        else
                lines
                echo "Filename:$filepath -> Not found"
        fi
fi
