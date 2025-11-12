#!/bin/bash

# Checks domain reachability, lists name servers, and optionally attempts a DNS zone transfer.

function lines {
        echo "**************************************************"
}

# Prompt user for domain name
read -p "Enter the domain name example abc.com: " domain_name

# Check if domain name is empty
if [ -z "$domain_name" ]
then
        lines
        echo "User input -- Domain name field is empty"

# Domain name is not empty
# Test if the domain resolves (silently discard output)
# Save nameservers to a temporary file
# Attempt zone transfer for each nameserver
 
elif [ -n "$domain_name" ]
then
        host www.$domain_name &>/dev/null

        if [ $? -eq 0 ]
        then
                echo "***************** Name Servers ********************"
                host -t ns $domain_name | cut -d " " -f4
                lines
                echo "Would you like to do a zone transfer y/n ?"
                read option

                if [ "$option" == "y" ]
                then
                        host -t ns $domain_name | cut -d " " -f4 > ./name_servers
                        for zone_transfer in $(cat ./name_servers)
                        do
                                lines
                                host -l $domain_name $zone_transfer

                        done

                elif [ "$option" == "n" ]
                then
                        lines
                        echo "You choose to quit"
                else
                        lines
                        echo "Invalid user input"
                fi
        else
                lines
                echo "Unable to connect -- $domain_name"
        fi
fi

# Clean up temporary file
rm -rf ./name_servers
