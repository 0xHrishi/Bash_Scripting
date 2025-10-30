#!/bin/bash

#Prompt user to enter input i.e. network part, first and last host
read -p "Enter the host part i.e. 1.1.1 : " network
read -p "Enter the first host : " first
read -p "Enter the last host : " last

# Simple helper function to print a separator line
function lines {
        echo "***********************************************************"
}

# network_check: ensure the network part contain only numeric values
function network_check {
        [[ $network =~ ^[0-9.]+$ ]]
}
# first_check: ensure "first" is numeric
function first_check {
        [[ $first =~ ^[0-9]+$ ]]
}
# last_check: ensure "last" is numeric
function last_check {
        [[ $last =~ ^[0-9]+$ ]]
}

# ------------------------------------------------------------------
#User input check
# If any user input is empty, display error message
# ------------------------------------------------------------------
if [ -z "$network" ] || [ -z "$first" ] || [ -z "$last" ]
then
        if [ -n "$network" ] && [ -z "$first" ] && [ -z "$last" ]
        then
                lines
                echo "First host field is empty"
                echo "Last host field is empty"
        elif [ -n "$network" ] && [ -n "$first" ] && [ -z "$last" ]
        then
                lines
                echo "Last host field is empty"
        elif [ -n "$network" ] && [ -z "$first" ] && [ -n "$last" ]
        then
                lines
                echo "First host field is empty"
        elif [ -z "$network" ] && [ -n "$first" ] && [ -n "$last" ]
        then
                lines
                echo "Network field is empty"
        elif [ -z "$network" ] && [ -z "$first" ] && [ -n "$last" ]
        then
                lines
                echo "Network field is empty"
                echo "First host field is empty"
        elif [ -z "$network" ] && [ -n "$first" ] && [ -z "$last" ]
        then
                lines
                echo "Network field is empty"
                echo "Last host field is empty"
        elif [ -z "$network" ] && [ -z "$first" ] && [ -z "$last" ]
        then
                lines
                echo "Network field is empty"
                echo "First host field is empty"
                echo "Last host field is empty"
        fi

# ------------------------------------------------------------------
# Check user input i.e. it contains only nuemric values
# If pass all conditions -- Loop through the host numbers using seq
# Check the exit status of ping to determine reachability
# ------------------------------------------------------------------
elif [ -n "$network" ] && [ -n "$first" ] && [ -n "$last" ]
then
        if ! network_check || ! first_check || ! last_check
        then
                if network_check && ! first_check && ! last_check
                then
                        lines
                        echo "Kindly check first host field input"
                        echo "Kindly check last host field input"
                elif network_check && first_check && ! last_check
                then
                        lines
                        echo "Kindly check last host field input"
                elif network_check && ! first_check && last_check
                then
                        lines
                        echo "Kindly check first host field input"
                elif ! network_check && ! first_check && last_check
                then
                        lines
                        echo "Kindly check network field input"
                        echo "Kindly check first host field input"
                elif ! network_check && first_check && ! last_check
                then
                        lines
                        echo "Kindly check network field input"
                        echo "Kindly check last host field input"
                elif ! network_check && ! first_check && ! last_check
                then
                        lines
                        echo "Kindly check network field input"
                        echo "Kindly check first host field input"
                        echo "Kindly check last host field input"
                fi

        elif network_check && first_check && last_check
        then
                for ip in $(seq $first $last)
                do
                        lines
                        echo "Checking $network.$ip"

                        ping -c 2 $network.$ip  &> /dev/null

                        if [ $? -eq 0 ]
                        then
                                echo "$network.$ip -- Active"
                                ping -c 2 $network.$ip | grep -i "64 bytes" | cut -d " " -f4 | tr ":" " " | uniq > ip_address &
                        else
                                echo "$network.$ip --> Not responding to ICMP probes"
                                continue
                        fi

                done
        fi
fi
