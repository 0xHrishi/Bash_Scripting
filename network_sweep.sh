#!/bin/bash

#oscp exercise for network sweeping i.e. to identify active hosts

function lines {
        echo "**************************************"
}

read -p "Enter the network address such as 192.168.100: " network
read -p "Enter the first host: " first
read -p "Enter the last host: " last

function network_right {
        [[ $network =~ ^[0-9.]+$ ]]
}
function network_wrong {
        [[ ! $network =~ ^[0-9.]+$ ]]
}
function first_right {
        [[ $first =~ ^[0-9]+$ ]]
}
function first_wrong {
        [[ ! $first =~ ^[0-9]+$ ]]
}
function last_right {
        [[ $last =~ ^[0-9]+$ ]]
}
function last_wrong {
        [[ ! $last =~ ^[0-9]+$ ]]
}


if [ -z "$network" ] || [ -z "$first" ] || [ -z "$last" ]
then
        if [ -n "$network" ] && [ -n "$first" ] && [ -z "$last" ]
        then
                lines
                echo "User input --> Last host field is empty"
        elif [ -n "$network" ] && [ -z "$first" ] && [ -z "$last" ]
        then
                lines
                echo "User input --> First host field is empty"
                echo "User input --> Last host field is empty"
        elif [ -z "$network" ] && [ -n "$first" ] && [ -n "$last" ]
        then
                lines
                echo "User input --> Network field is empty"
        elif [ -z "$network" ] && [ -z "$first" ] && [ -n "$last" ]
        then
                lines
                echo "User input --> Network field is empty"
                echo "User input --> First host field is empty"
        elif [ -z "$network" ] && [ -n "$first" ] && [ -z "$last" ]
        then
                lines
                echo "User input --> Network field is empty"
                echo "User input --> Last host field is empty"
        elif [ -n "$network" ] && [ -z "$first" ] && [ -n "$last" ]
        then
                lines
                echo "User input --> First host field is empty"
        elif [ -z "$network" ] && [ -z "$first" ] && [ -z "$last" ]
        then
                lines
                echo "User input --> Network field is empty"
                echo "User input --> First host field is empty"
                echo "User input --> Last host field is empty"
        fi

elif [ -n "$network" ] && [ -n "$first" ] && [ -n "$last" ]
then
        if network_wrong || first_wrong || last_wrong
        then
                if network_right && first_right && last_wrong
                then
                        lines
                        echo "Last host must contain only numeric values"
                elif network_right && first_wrong && last_wrong
                then
                        lines
                        echo "First host must contain only numeric values"
                        echo "Last host must contain only numeric values"
                elif network_wrong && first_right && last_right
                then
                        lines
                        echo "Network field must contain only numeric values"
                elif network_wrong && first_wrong && last_right
                then
                        lines
                        echo "Network field must contain only numeric values"
                        echo "First host must contain only numeric values"
                elif network_wrong && first_right && last_wrong
                then
                        lines
                        echo "Network field must contain only numeric values"
                        echo "Last host must contain only numeric values"
                elif network_wrong && first_right && last_right
                then
                        lines
                        echo "Network field must contain only numeric values"
                elif network_wrong && first_wrong && last_wrong
                then
                        lines
                        echo "Network field must contain only numeric values"
                        echo "First host must contain only numeric values"
                        echo "Last host must contain only numeric values"
                fi
        elif network_right && first_right && last_right
        then
                echo "Please wait, checking for active hosts"
                for host_alive in $(seq $first $last)
                do
                        ping -c 1 $network.$host_alive | grep -i "64 bytes" | cut -d " " -f4 | tr -d ":" >> active_hosts 2>/dev/null &
                        sleep 0.2
                done

                if [ -s active_hosts ] && [ -f active_hosts ]
                then
                        lines
                        echo "Host active"
                        cat active_hosts | sort | uniq
                else
                        lines
                        echo "Not active hosts found"
                fi
        fi
fi
rm -rf ./1
rm -rf ./active_hosts
