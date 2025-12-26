#!/bin/bash
# Brute force attack on the domain name, to find different hostname

function lines {
        echo "****************************************************************"
}

# color codes for error messages
red='\033[0;31m'
nf='\033[0m'

# User input
read -p "Enter the domain example: abc.com: " domain_name
read -p "Enter the file path for brute force: " file

# User input -- empty
if [ -z "$domain_name" ] || [ -z "$file" ]
then
        lines
        if [ -z "$domain_name" ]
        then
                echo -e "${red}User input --> Domain name field is empty${nf}"
        fi
        if [ -z "$file" ]
        then
                echo -e "${red}User input --> Filepath field is empty${nf}"
        fi
# If both inputs are provided
# Check if the file exists
# If input path is a non-empty regular file, Loop through each subdomain in the wordlist
elif [ -n "$domain_name" ] && [ -n "$file" ]
then
        if [ -e "$file" ]
        then
                lines
                if [ -d "$file" ]
                then
                        echo -e "${red}$file --> Its a directory${nf}"
                elif [ -f "$file" ] && [ -s "$file" ]
                then
                        for hostnames in $(cat $file)
                        do
                                lines
                                host $hostnames.$domain_name &>/dev/null

                                if [ $? -eq 0 ]
                                then
                                        host $hostnames.$domain_name
                                        sleep 0.2
                                else
                                        echo "$hostnames.$domain_name --> No public DNS records"
                                        sleep 0.2
                                fi
                        done

                else
                        echo -e "${red}File found -- Unable to identify the file type"
                fi
        else
                lines
                echo -e "${red}$file -- Not found${nf}"
        fi
fi
