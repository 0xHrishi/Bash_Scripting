#!/bin/bash
#   This script performs a simple network ping sweep.

function lines {
        echo "******************************************************"
}
# color codes for error messages
RED='\033[1;31m'
NF='\033[0m'
# function to validate user input
function network_check {
        [[ $network =~ ^([0-9]{1,3}\.){2}[0-9]{1,3}$ ]]
}
function first_host_check {
        [[ $first_host =~ ^[0-9]{1,3}$ ]]
}
function last_host_check {
        [[ $last_host =~ ^[0-9]{1,3}$ ]]
}

# user input
read -p "Enter the network part such as 1.1.1: " network
read -p "Enter the first host: " first_host
read -p "Enter the last host: " last_host

# user input empty
if [ -z "$network" ] || [ -z "$first_host" ] || [ -z "$last_host" ]
then
        lines
        if [ -z "$network" ]
        then
                echo -e "${RED}User input --> Network field is empty${NF}"
        fi
        if [ -z "$first_host" ]
        then
                echo -e "${RED}User input --> First host is empty${NF}"
        fi
        if [ -z "$last_host" ]
        then
                echo -e "${RED}User input --> Last host is empty${NF}"
        fi

# user input not empty
# validate user input
# Ensure last host is not greater than 255
# Loop through host range
# If ping successful, print active host IP
else
        if ! network_check || ! first_host_check || ! last_host_check
        then
                lines
                if ! network_check
                then
                        echo -e "${RED}Kindly check the network user input${NF}"
                fi
                if ! first_host_check
                then
                        echo -e "${RED}Kindly check the first host user input${NF}"
                fi
                if ! last_host_check
                then
                        echo -e "${RED}Kindly check the last host user input${NF}"
                fi
        else
                lines
                if [ $last_host -gt 255 ]
                then
                        echo -e "${RED}last host cannot be greater than 255${NF}"
                else
                        for network_sweep in $(seq $first_host $last_host)
                        do
                                ping -c 1 "$network.$network_sweep" &>/dev/null &

                                if [ $? -eq 0 ]
                                then
                                        ping -c 1 "$network.$network_sweep" | grep -i "64 bytes" | cut -d " " -f4 | tr -d ":" &
                                fi
                        done
                fi
        fi
fi
