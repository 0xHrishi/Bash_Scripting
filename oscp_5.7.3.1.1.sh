#!/bin/bash

#oscp exercise for network sweep

#delete any previous file
rm -rf ./host_alive

#user input --> network part, frst and last host range
echo "Enter the network part i.e. 1.1.1"
read network
echo "Enter the first host"
read first
echo "Enter the last host"
read last



function lines {
        echo "**********************************"
}

#function to make sure the network field must contain numeric values and special character '.'
function network_right {
        [[ $network =~ ^[0-9.]+$ ]]
}
function network_wrong {
        [[ ! $network =~ ^[0-9.]+$ ]]
}

#function to make sure the first host field must contain numeric values
function first_right {
        [[ $first =~ ^[0-9]+$ ]]
}
function first_wrong {
        [[ ! $first =~ ^[0-9.]+$ ]]
}

#function to make sure the last host field must contain numeric values
function last_right {
        [[ $last =~ ^[0-9]+$ ]]
}
function last_wrong {
        [[ ! $last =~ ^[0-9.]+$ ]]
}

#User input is empty or length of the string is equal to zero
if [ -z "$network" ] || [ -z "$first" ] || [ -z "$last" ]
then
        if [ -n "$network" ] && [ -n "$first" ] && [ -z "$last" ]
        then
                lines
                echo "Last host field is empty"
        elif [ -n "$network" ] && [ -z "$first" ] && [ -z "$last" ]
        then
                lines
                echo "First host field is empty"
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
        else
                lines
                echo "Issues with the user input"
        fi

#user input check 
elif [ -n "$network" ] && [ -n "$first" ] && [ -n "$last" ]
then

        #makeing sure the user input is as expected 
        if network_wrong || first_wrong || last_wrong
        then
                if network_right && first_right && last_wrong
                then
                        lines
                        echo "Last host field must contain only numeric values"
                elif network_right && first_wrong && last_wrong
                then
                        lines
                        echo "First host field must contain only numeric values"
                        echo "Last host field must contain only numeric values"
                elif network_right && first_wrong && last_right
                then
                        lines
                        echo "First host field must contain only numeric values"
                elif network_wrong && first_right && last_right
                then
                        lines
                        echo "Network field must contain only numeric values"
                elif network_wrong && first_wrong && last_right
                then
                        lines
                        echo "Network field must contain only numeric values"
                        echo "First host field must contain only numeric values"
                elif network_wrong && first_right && last_wrong
                then
                        lines
                        echo "Network field must contain only numeric values"
                        echo "Last host field must contain only numeric values"
                elif network_wrong && first_wrong && last_wrong
                then
                        lines
                        echo "Network field must contain only numeric values"
                        echo "First host field must contain only numeric values"
                        echo "Last host field must contain only numeric values"
                else
                        lines
                        echo "Issues with user input validation"
                fi

        #user input contain numeric values for first and last host range and network part
        elif network_right && first_right && last_right
        then
                if [ $first -eq $last ]
                then
                        lines
                        echo "First host is equal to second host"
                        echo "Nothing can be done"
                elif [ $first -gt $last ]
                then
                        lines
                        echo "First host is greather than second host"
                        echo "Nothing can be done"
                elif [ $first -lt $last ]
                then
                        lines
                        echo "Checking for live host"

                        #for loop for network sweep and the output is getting saved inside host_aive file
                        for host_alive in $(seq $first $last)
                        do
                                ping -c 1 $network.$host_alive | grep -i "64 bytes" &>/dev/null &

                                if [ $? -eq 0 ]
                                then
                                        ping -c 1 $network.$host_alive | grep -i "64 bytes" | cut -d " " -f4 | tr -d ":" >> ./host_alive &
                                else
                                        continue
                                fi
                        done
                        if [ -s ./host_alive ]
                        then
                                lines
                                echo "***********Host found*************"
                                cat ./host_alive
                        else
                                lines
                                echo "*********No host found**********"
                        fi
                fi
        fi
fi
