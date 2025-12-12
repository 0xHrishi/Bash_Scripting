#!/bin/bash

# This script takes a domain name (e.g., abc.com) and a file path that contains
# hostnames (one per line).
function lines {
        echo "*************************************************************"

}

# Prompt user input
read -p "Enter the domain name i.e. abc.com: " domain_name
read -p "Enter the file path: " filepath

# User input empty
if [ -z "$domain_name" ] || [ -z "$filepath" ]
then
        if [ -n "$domain_name" ] && [ -z "$filepath" ]
        then
                lines
                echo "User input --> Filepath field is empty"
        elif [ -z "$domain_name" ] && [ -n "$filepath" ]
        then
                lines
                echo "User input --> Domain name field is empty"
        elif [ -z "$domain_name" ] && [ -z "$filepath" ]
        then
                lines
                echo "User input --> Domain name field is empty"
                echo "User input --> Filepath field is empty"
        fi

# Proceed when both domain name and file path are provided
# Checks whether the file exists, is readable, and is not empty.


elif [ -n "$domain_name" ] && [ -n "$filepath" ]
then
        if [ -e $filepath ]
        then
                if [ -f $filepath ] && [ -s $filepath ]
                then
                        for hostname in $(cat $filepath)
                        do
                                host $hostname.$domain_name &>/dev/null

                                if [ $? -eq 0 ]
                                then
                                        lines
                                        host $hostname.$domain_name
                                        sleep 0.2
                                else
                                        lines
                                        echo "$hostname.$domain_name --> NO PUBLIC DNS RECORDS"
                                        sleep 0.2
                                        continue
                                fi
                        done

                elif [ -d $filepath ]
                then
                        lines
                        echo "$filepath --> Its a directory"
                else
                        lines
                        echo "$filepath --> Found, but unable to identify the file type"
                fi
        else
                lines
                echo "$filepath --> Not found"
        fi
fi
