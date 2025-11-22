#!/bin/bash

# Performs reverse DNS lookup for a given network (x.x.x.1 to x.x.x.255)
function lines {
        echo "******************************************************************************"
}

# Validate that user input contains only digits and dots 
function network_check {
        [[ $network =~ ^[0-9.]+$ ]]
}

# User input
read -p "Enter the network part example - 1.1.1: " network

# If user input is empty
if [ -z "$network" ]
then
        lines
        echo "User input -- Network field is empty"

# User input is not empty
# If input is provided, validate format
# If validation passes, start reverse DNS lookups
# Try to resolve host using DNS (suppress errors)

elif [ -n "$network" ]
then
        if ! network_check
        then
                lines
                echo "Network field must contain only numeric values"
        elif network_check
        then
                for reverse_lookup in $(seq 1 255)
                do
                        host $network.$reverse_lookup &>/dev/null

                        if [ $? -eq 0 ]
                        then
                                lines
                                host $network.$reverse_lookup
                                sleep 0.2
                                continue
                        else
                                lines
                                echo "$network.$reverse_lookup -- NO RECORDS"
                                sleep 0.2
                                continue
                        fi

                done
        fi

fi
