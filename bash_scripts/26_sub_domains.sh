#!/bin/bash
# Description : This script performs subdomain brute-forcing on a domain using a wordlist
function lines {
        echo "*****************************************************"
}

# color codes for error messafes
RED='\033[1;31m'
NF='\033[0m'

# User input
read -p "Enter the domain name: " domain_name
read -p "Enter the wordlists filepath for brute force attack: " filepath

# user input empty
if [ -z "$domain_name" ] || [ -z "$filepath" ]
then
        lines
        if [ -z "$domain_name" ]
        then
                echo -e "${RED}User input --> Domain name field is empty${NF}"
        fi
        if [ -z "$filepath" ]
        then
                echo -e "${RED}User input --> Filepath field is empty${NF}"
        fi
# user input not empty
# Check if file path exists
# regular file exist, Perform DNS lookup and display result
else
        lines
        if [ -e "$filepath" ]
        then
                if [ -d "$filepath" ]
                then
                        echo -e "${RED}File: $filepath, its a directory${NF}"
                elif [ -f "$filepath" ] && [ -s "$filepath" ]
                then
                        for sub_domains in $(cat $filepath)
                        do
                                lines
                                host $sub_domains.$domain_name &>/dev/null

                                if [ $? -eq 0 ]
                                then
                                        echo -e "${RED}$(host $sub_domains.$domain_name)${NF}"
                                        sleep 0.2
                                else
                                        echo "$sub_domains.$domain_name --> NO DNS RECORDS"
                                        sleep 0.2

                                fi

                        done
                else
                        echo -e "${RED}File: $filepath, Unable to identify the file type${NF}"

                fi
        else
                echo -e "${RED}File: $filepath, Invalid filepath${NF}"

        fi
fi
