#!/bin/bash
#   This script attempts a DNS Zone Transfer (AXFR) against
#   the name servers of a given domain.
function lines {
        echo "******************************************************"
}
# color codes for error
RED='\033[1;31m'
NF='\033[0m'
# user input
read -p "Enter the domain name such as abc.com: " domain_name

# user input empty
if [ -z "$domain_name" ]
then
        lines
        echo -e "${RED}User input --> Domain name field is empty${NF}"
# user input not empty
# Retrieve NS records and extract nameserver hostnames
# Loop through each nameserver and attempt zone transfer
 # If transfer succeeds, display full zone dat
else
        host -t ns $domain_name | cut -d " " -f4 1> name_servers

        echo "********Zone file transfer***************"

        for zone_file_transfer in $(cat ./name_servers)
        do
                host -l "$domain_name" "$zone_file_transfer" &>/dev/null

                if [ $? -eq 0 ]
                then
                        host -l $domain_name $zone_file_transfer
                fi
        done
fi
rm -rf ./name_servers
