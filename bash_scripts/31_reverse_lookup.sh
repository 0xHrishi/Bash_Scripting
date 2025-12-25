#!/bin/bash
# Performs reverse DNS lookups for a given network prefix
# Iterates from .1 to .255 and checks for PTR records

function lines {
        echo "****************************************************************"
}

# color codes for error messages
red='\033[0;31m'
nf='\033[0m'

# Function to validate user input format
function network_check {
        [[ $network =~ ^[1-9][0-9]*$ ]]
}

# Read network prefix from user
read -p "Enter the network part from reverse lookup such as 1.1.1: " network

# user input empty
if [ -z "$network" ]
then
        lines
        echo -e "${red}User input --> Network field is empty${nf}"
# user iput not empty
# Validate network input
# If validation passes, perform reverse lookup
else
        lines
        if ! network_check
        then
                echo -e "${red}Kindy check the network field format${nf}"
        elif network_check
        then
                for reverse_lookup in {1..255}
                do
                        lines
                        host $network.$reverse_lookup &>/dev/null
                        if [ $? -eq 0 ]
                        then
                                host $network.$reverse_lookup
                                sleep 0.1
                        else
                                echo -e "${red}$network.$reverse_lookup --> No DNS records${nf}"
                                sleep 0.1
                                continue
                        fi
                done

        fi
fi
