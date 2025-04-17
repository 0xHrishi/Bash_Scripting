#!/bin/bash

function lines {
        echo "*********************************************"
}


echo "Enter the network part i.e. 1.1.1"
read network
echo "Enter the first host"
read first
echo "Enter the last host"
read last

if [ -z "$network" ] || [ -z "$first" ] || [ -z "$last" ]
then
        lines
        echo "User input missing, kindly check"
else
        for ip_address in $(seq $first $last)
        do
                host $network.$ip_address &>/dev/null
                if [ $? -eq 0 ]
                then
                        lines
                        host $network.$ip_address
                        sleep 0.5
                else
                        sleep 0.5
                        continue
                fi

        done
fi

