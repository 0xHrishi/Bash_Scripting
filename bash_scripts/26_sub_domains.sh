#!/bin/bash
# Performs subdomain brute-forcing using a wordlist
# and checks for public DNS records using the `host` command.

function lines {
        echo "****************************************************************************"
}

# color code for error messages
red='\033[0;31m'
nf='\033[0m'

# Read user input
read -p "Enter the domain name: " domain_name
read -p "Enter the filepath for brute force: " filepath

# User input empty
if [ -z "$domain_name" ] || [ -z "$filepath" ]
then
        lines
        if [ -z "$domain_name" ]
        then
                echo -e "${red}User input -- Domain name field is empty${nf}"
        fi
        if [ -z "$file_path" ]
        then
                echo -e "${red}User input -- Filepath field is empty${nf}"
        fi

# User input not empty
# Valid regular file and its not empty, 
# Read each subdomain from the wordlist
# Suppress output, check only exit status
elif [ -n "$domain_name" ] && [ -n "$filepath" ]
then
        if [ -e $filepath ]
        then
                lines
                if [ -d $filepath ]
                then
                        echo "$filepath --> Its a directory"
                elif [ -f $filepath ] && [ -s $filepath ]
                then
                        for sub_domains in $(cat $filepath)
                        do
                                lines
                                host $sub_domains.$domain_name &>/dev/null

                                if [ $? -eq 0 ]
                                then
                                        host $sub_domains.$domain_name
                                        sleep 0.2
                                else
                                        echo "$sub_domains.$domain_name --> No public dns records"
                                        sleep 0.2
                                        continue
                                fi

                        done

                else
                        echo "$filepath --> File found, but unable to identify the filetype"
                fi
        fi
fi
