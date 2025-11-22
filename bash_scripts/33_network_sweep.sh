#!/bin/bash
###############################################################
# Script Name : Simple Network Host Scanner
#
# Description :
#   - The user enters:
#         1) Network part (e.g., 192.168.100)
#         2) First host number
#         3) Last host number
#
#   - The script validates:
#         • Network input contains only digits and dots,
#           and does not start with zero.
#             → Regex used: ^[1-9][0-9.]*$
#
#         • First and last host must be ONLY digits.
#             → Regex used: ^[0-9]+$
#
#   - If input is valid, it scans hosts using ping.
#   - Active hosts are stored temporarily and printed at the end.
###############################################################

# Prints a separation line for clean output
function lines {
        echo "*************************************************************"
}

# Checks if network part is valid (digits + dots, no leading zero)
function network_check {
        [[ $network =~ ^[1-9][0-9.]*$ ]]
}

# Checks if first host number is valid (digits only)
# Checks if last host number is valid (digits only)
function first_check {
        [[ $first =~ ^[0-9]+$ ]]
}
function last_check {
        [[ $last =~ ^[0-9]+$ ]]
}


# --------------------------------------------------------------
# User Input
# --------------------------------------------------------------
read -p "Enter the network part, eg 10.10.10: " network
read -p "Enter the first host: " first
read -p "Enter the last host: " last

# --------------------------------------------------------------
# EMPTY FIELD VALIDATION
# If any of the fields are empty, print which ones are empty.
# --------------------------------------------------------------
if [ -z "$network" ] || [ -z "$first" ] || [ -z "$last" ]
then
        if [ -n "$network" ] && [ -z "$first" ] && [ -z "$last" ]
        then
                lines
                echo "User input -- First host field is empty"
                echo "User input -- Last host field is empty"
        elif [ -n "$network" ] && [ -n "$first" ] && [ -z "$last" ]
        then
                lines
                echo "User input -- Last host field is empty"
        elif [ -n "$network" ] && [ -z "$first" ] && [ -n "$last" ]
        then
                lines
                echo "User input -- First host field is empty"
        elif [ -z "$network" ] && [ -n "$first" ] && [ -n "$last" ]
        then
                lines
                echo "User input -- Network part field is empty"
        elif [ -z "$network" ] && [ -z "$first" ] && [ -n "$last" ]
        then
                lines
                echo "User input -- Network part field is empty"
                echo "User input -- First host field is empty"
        elif [ -z "$network" ] && [ -n "$first" ] && [ -z "$last" ]
        then
                lines
                echo "User input -- Network part field is empty"
                echo "User input -- Last host field is empty"
        elif [ -z "$network" ] && [ -z "$first" ] && [ -z "$last" ]
        then
                lines
                echo "User input -- Network part field is empty"
                echo "User input -- First host field is empty"
                echo "User input -- Last host field is empty"
        fi

# --------------------------------------------------------------
# INPUT FORMAT VALIDATION 
# Valid input -- MAIN HOST SCANNING LOOP
# Store only the IP address extracted from ping output
# DISPLAY FINAL ACTIVE HOSTS
# --------------------------------------------------------------
elif [ -n "$network" ] && [ -n "$first" ] && [ -n "$last" ]
then
        if ! network_check || ! first_check || ! last_check
        then
                if network_check && ! first_check && ! last_check
                then
                        lines
                        echo "User input -- First host field has invalid entry"
                        echo "User input -- Last host field has invalid entry"
                elif network_check && first_check && ! last_check
                then
                        lines
                        echo "User input -- Last host field has invalid entry"
                elif network_check && ! first_check && last_check
                then
                        lines
                        echo "User input -- First host field has invalid entry"
                elif ! network_check && first_check && last_check
                then
                        lines
                        echo "User input -- Network part has invalid entry"
                elif ! network_check && ! first_check && last_check
                then
                        lines
                        echo "User input -- Network part has invalid entry"
                        echo "User input -- First host field has invalid entry"
                elif ! network_check && first_check && ! last_check
                then
                        lines
                        echo "User input -- Network part has invalid entry"
                        echo "User input -- Last host field has invalid entry"
                elif ! network_check && ! first_check && ! last_check
                then
                        lines
                        echo "User input -- Network part has invalid entry"
                        echo "User input -- First host field has invalid entry"
                        echo "User input -- Last host field has invalid entry"
                fi
        elif network_check && first_check && last_check
        then
                for host_alive in $(seq $first $last)
                do
                        ping -c 2 $network.$host_alive &>/dev/null

                        if [ $? -eq 0 ]
                        then
                                lines
                                echo "Active -- $network.$host_alive"
                                ping -c 2 $network.$host_alive | grep -i "64" | cut -d " " -f4 | tr -d ":" >>./host_alive &
                                sleep 0.1
                        else
                                lines
                                echo "Not active -- $network.$host_alive"
                                sleep 0.1
                                continue
                        fi
                done
                lines
                cat ./host_alive | sort | uniq
        fi

fi

# --------------------------------------------------------------
# CLEANUP
# --------------------------------------------------------------
rm -rf ./host_alive
