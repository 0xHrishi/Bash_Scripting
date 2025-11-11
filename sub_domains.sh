#!/bin/bash
#This script checks if subdomains (listed in a file) have public DNS records.
function lines {
        echo "******************************************************************************"
}

# User prompt 
read -p "Enter the domain name example - google.com: " domain_name
read -p "Enter the filename with its full path: " file

#Validate user input (both fields must not be empty)
if [ -z "$domain_name" ] || [ -z "$file" ]
then
        if [ -n "$domain_name" ] && [ -z "$file" ]
        then
                lines
                echo "User input -- File name field is empty"
        elif [ -z "$domain_name" ] && [ -n "$file" ]
        then
                lines
                echo "User input -- Domain name field is empty"
        elif [ -z "$domain_name" ] && [ -z "$file" ]
        then
                lines
                echo "User input -- Domain name field is empty"
                echo "User input -- File name field is empty"
        fi

# Continue only if both inputs are provided
# Check if the given file exists
# Perform DNS lookup for subdomain.domain_name
elif [ -n "$domain_name" ] && [ -n "$file" ]
then
        if [ -e "$file" ]
        then
                if [ -d "$file" ]
                then
                        lines
                        echo "$file -- Its a directory"
                elif [ -s "$file" ] && [ -f "$file" ]
                then
                        for sub_domains in $(cat $file)
                        do
                                host $sub_domains.$domain_name &>/dev/null

                                if [ $? -eq 0 ]
                                then
                                        lines
                                        host $sub_domains.$domain_name
                                        sleep 0.2
                                        continue
                                else
                                        lines
                                        echo "$sub_domains.$domain_name -- NO PUBLIC DNS RECORDS"
                                        sleep 0.2
                                        continue
                                fi
                        done
                fi
        else
                lines
                echo "$file -- Not found"
        fi
fi
