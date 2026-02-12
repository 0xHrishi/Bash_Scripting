#!/bin/bash
# Performs reverse DNS lookups for a /24 subnet.
function lines {
        echo "******************************************************"
}

# color codes for error messages
RED='\033[1;31m'
NF='\033[0m'

# function to validate user input
function ip_address_check {
        [[ $ip_address =~ ^([0-9]{1,3}\.){2}[0-9]{1,3}$ ]]
}

# script description
echo -e "${RED}Reverse lookup${NF}"

# prompt for user iput
read -p "Enter the IP address such as 1.1.1: " ip_address

# user input empty
if [ -z "$ip_address" ]
then
        lines
        echo -e "${RED}User input --> IP address field is empty${NF}"
# user input not empty
# Function to check theuser input contain numeric values with . 
# Loop through host range 1–255
# Perform reverse DNS lookup 
# If host command succeeds, print result
else
        lines
        if ! ip_address_check
        then
        echo -e "${RED}Kindly check IP address field${NF}"
        else
                for reverse_lookup in {1..255}
                do
                        host $ip_address.$reverse_lookup &>/dev/null

                        if [ $? -eq 0 ]
                        then
                                echo -e "${RED}$(host $ip_address.$reverse_lookup)${NF}"
                                sleep 0.2
                        fi

                done
        fi
fi
