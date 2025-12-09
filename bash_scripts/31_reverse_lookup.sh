#!/bin/bash

function lines {
        echo "*************************************************************"
}

function reverse_lookup_check {
        [[ $reverse_lookup =~ ^[0-9.]+$ ]]
}

# Prompt for user input
read -p "Enter the IP address for reverse loopkup: " reverse_lookup

# User input empty
if [ -z "$reverse_lookup" ]
then
        lines
        echo "User input -- Reverse lookup field is empty"
        
# Input is NOT empty
# If the input contains characters other than digits and dots
# Loop from 1 to 255 for DNS reverse scanning
elif [ -n "$reverse_lookup" ]
then
        if ! reverse_lookup_check
        then
                lines
                echo "Reverse lookup field must contain only numeric values"
        elif reverse_lookup_check
        then

                for ip in $(seq 1 255)
                do
                        host $reverse_lookup.$ip &>/dev/null

                        if [ $? -eq 0 ]
                        then
                                lines
                                host $reverse_lookup.$ip
                                sleep 0.2
                        else
                                echo "$reverse_lookup.$ip -- No DNS Record"
                                sleep 0.2
                                continue
                        fi
                done
        fi
fi
