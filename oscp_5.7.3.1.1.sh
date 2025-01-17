#oscp exercise for network sweep 

#!/bin/bash

echo "Enter the network i.e 1.1.1"
read network
echo "Enter the first host"
read first
echo "Enter the last host"
read last

if [ -z "$network" ] || [ -z "$first" ] || [ -z "$last" ]
then
        if [ -n "$network" ] && [ -z "$first" ] && [ -z "$last" ]
        then
                echo "*********************************************"
                echo "First host field empty"
                echo "Last host field empty"
                echo "*********************************************"
        elif [ -n "$network" ] && [ -n "$first" ] && [ -z "$last" ]
        then
                echo "*********************************************"
                echo "Last host field empty"
                echo "*********************************************"
        elif [ -n "$network" ] && [ -z "$first" ] && [ -n "$last" ]
        then
                echo "*********************************************"
                echo "First host field empty"
                echo "*********************************************"
        elif [ -z "$network" ] && [ -z "$first" ] && [ -n "$last" ]
        then
                echo "*********************************************"
                echo "Network field empty"
                echo "First host field empty"
                echo "*********************************************"
        elif [ -z "$network" ] && [ -n "$first" ] && [ -n "$last" ]
        then
                echo "*********************************************"
                echo "Network field empty"
        elif [ -z "$network" ] && [ -n "$first" ] && [ -z "$last" ]
        then
                echo "*********************************************"
                echo "Network field empty"
                echo "Last host field empty"
                echo "*********************************************"
        elif [ -z "$network" ] && [ -z "$first" ] && [ -z "$last" ]
        then
                echo "*********************************************"
                echo "Network field empty"
                echo "First host field empty"
                echo "Last host field empty"
                echo "*********************************************"
        else
                echo "*********************************************"
                echo "Issues with the user input"
                echo "*********************************************"
        fi
elif [ -n "$network" ] && [ -n "$first" ] && [ -n "$last" ]
then
        for host_alive in $(seq $first $last)
        do
                echo "******Checking $network.$host_alive************"
                ping -c 1 $network.$host_alive | grep -i "64 bytes" | cut -d " " -f4 >> ./network-sweep &
                sleep 0.2

        done
        if [ -s ./network-sweep ]
        then
                echo "***********************************************"
                echo "*****Hosts found*****"
                cat network-sweep
        else
                echo "***********************************************"
                echo "*****No Hosts found*****"
        fi
fi
rm -rf ./1
rm -rf ./network-sweep


---------------------------------------------------------------------------------------------------------------------------------------------------------------------
#advanced
#!/bin/bash

echo "Enter the network part i.e. 1.1.1"
read network
echo "Enter the first host"
read first
echo "Enter the last host"
read last


function lines {
        echo "******************************************"
}

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
        elif [ -z "$network" ] && [ -z "$first" ] && [ -n "$last" ]
        then
                lines
                echo "Network field is empty"
                echo "First host field is empty"
        elif [ -z "$network" ] && [ -n "$first" ] && [ -n "$last" ]
        then
                lines
                echo "Network field is empty"
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
                echo "Second host field is empty"
        else
                lines
                echo "Issues with user input checking"
        fi
elif [ -n "$network" ] && [ -n "$first" ] && [ -n "$last" ]
then
        if network_wrong || first_wrong || last_wrong
        then
                if network_right && first_wrong && last_wrong
                then
                        lines
                        echo "First host field must contain only numeric values"
                        echo "Last host field must contain only numeric values"
                elif network_right && first_right && last_wrong
                then
                        lines
                        echo "Last host field must contain only numeric values"
                elif network_right && first_wrong && last_right
                then
                        lines
                        echo "First host field must contain only numeric values"
                elif network_wrong && first_wrong && last_right
                then
                        lines
                        echo "Network field must contain only numeric values"
                        echo "First host field must contain only numeric values"
                elif network_wrong && first_right && last_right
                then
                        lines
                        echo "Network field must contain only numeric values"
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
        elif network_right && first_right && last_right
        then
                for host_alive in $(seq $first $last)
                do
                        ping -c 2 $network.$host_alive | grep -i "64 bytes" | cut -d " " -f4 |tr -d ":" | uniq >> ./ip_address 2>/dev/null &
                done
                        if [ -s ./ip_address ]
                        then
                                lines
                                cat ./ip_address
                        else
                                lines
                                echo "No active host found"
                        fi
        fi
fi
rm -rf ./1
