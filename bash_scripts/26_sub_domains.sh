#!/bin/bash

# SCRIPT -- brute force attack on domain to find sub domains 

function lines {
        echo "*************************************************************"
}

# Asking the user to enter a domain name (e.g., example.com)
# Asking the user to enter the path of the file that contains subdomains
read -p "Enter the domain name such as abc.com: " domain_name
read -p "Enter the filepath: " file

# Check if the user input is empty
if [ -z "$domain_name" ] || [ -z "$file" ]
then
        if [ -n "$domain_name" ] && [ -z "$file" ]
        then
                lines
                echo "User input -- Filepath field is empty"
        elif [ -z "$domain_name" ] && [ -n "$file" ]
        then
                lines
                echo "User input -- Domain name field is empty"
        elif [ -z "$domain_name" ] && [ -z "$file" ]
        then
                lines
                echo "User input -- Domain name field is empty"
                echo "User input -- Filepath field is empty"
        fi

# IF BOTH INPUTS ARE PROVIDED, CONTINUE
# Check if the file actually exists i.e. whether its a directory or a file
 # If the path is a non-empty file and a regular file, Loop through each subdomain in the file
elif [ -n "$domain_name" ] && [ -n "$file" ]
then
        if [ -e $file ]
        then
                if [ -d $file ]
                then
                        lines
                        echo "$file -- Its a directory"
                elif [ -s $file ] && [ -f $file ]
                then
                        for sub_domains in $(cat $file)
                        do
                                host $sub_domains.$domain_name &>/dev/null

                                if [ $? -eq 0 ]
                                then
                                        lines
                                        host $sub_domains.$domain_name
                                        sleep 0.2
                                else
                                        lines
                                        echo "$sub_domains.$domain_name NO VALID DNS RECORDS"
                                        sleep 0.2
                                fi
                        done
                else
                        lines
                        echo "$file found -- Unable to identify the filetype"
                fi
        fi
fi

