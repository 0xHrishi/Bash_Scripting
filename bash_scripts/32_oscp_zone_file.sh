#!/bin/bash
# Performs DNS enumeration and attempts zone transfer (AXFR) on a given domain.
function lines {
        echo "****************************************************************"
}

# color code for error messages
red='\033[0;31m'
nf='\033[0m'

# Prompt userinput
read -p "Enter the domain name i.e. www.abc.com: " domain_name

# id user input empty
if [ -z "$domain_name" ]
then
        lines
        echo -e "${red}User input -- Domain name field is empty${nf}"
# User input not empty
# Check whether the domain has public DNS records
# Display DNS information for the domain and display the dns servers 
# Save name servers to a file for zone transfer attempts
# Attempt zone file transfer
elif [ -n "$domain_name" ]
then
        lines
        host $domain_name &>/dev/null

        if [ $? -eq 0 ]
        then
                host $domain_name
                lines
                echo -e "${red}Looking for DNS Servers${nf}"
                sleep 0.2
                domain_name=$(echo "$domain_name" | cut -d "." -f2,3)
                host -t ns $domain_name | cut -d " " -f4
                host -t ns $domain_name | cut -d " " -f4 > dns_servers
                lines
                echo -e "${red}Zone file transfer${nf}"

                lines
                for zone_transfer in $(cat dns_servers)
                do
                        host -l $domain_name $zone_transfer &>/dev/null

                        if [ $? -eq 0 ]
                        then
                                host -l $domain_name $zone_transfer
                        else
                                continue
                        fi
                done
        else
                echo "$domain_name --> No public DNS records"

        fi
fi
rm -rf ./dns_servers
