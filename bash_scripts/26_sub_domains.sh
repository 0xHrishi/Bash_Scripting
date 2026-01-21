#!/bin/bash

# brute force attack on a domain to find sub domains 
function lines {
        echo "****************************************************************"
}

# color codes for error messages
RED='\033[0;31m'
NF='\033[0m'

# user instructions
echo -e "${RED}Brute force attack on domain to find sub domains${NF}"
sleep 0.2
# prompt for user input
read -p "Enter the domain, example as abc.com: " domain_name
read -p "Enter the file path which consists list of hostnames: " file

# user input empty
if [ -z "$domain_name" ] || [ -z "$file" ]
then
        lines
        if [ -z "$domain_name" ]
        then
                echo -e "${RED}User input --> Domain name field is empty${NF}"
        fi
        if [ -z "$file" ]
        then
                echo -e "${RED}User input --> Filepath field is empty${NF}"
        fi

# user input is not empty
# Check if file exists, Suppress output and check DNS resolution
elif [ -n "$domain_name" ] && [ -n "$file" ]
then
        lines
        if [ -e $file ]
        then
                if [ -d $file ]
                then
                        echo -e "${RED}File: $file is a directory${NF}"
                elif [ -f $file ] && [ -s $file ]
                then
                        while read -r sub_domains
                        do
                                host $sub_domains.$domain_name &>/dev/null

                                if [ $? -eq 0 ]
                                then
                                        output=$(host $sub_domains.$domain_name)
                                        echo -e "${RED}$output${NF}"
                                        sleep 0.5
                                        lines
                                else
                                        echo -e "$sub_domains.$domain_name --> No DNS records found"
                                        sleep 0.5
                                        lines
                                fi

                        done < $file
                else
                        echo -e "${RED}File: $file found, unable to identify the file type${NF}"
                fi
        else
                echo -e "${RED}File: $file not found${NF}"

        fi
fi
