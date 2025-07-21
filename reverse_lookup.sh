#!/bin/bash

function lines {
        echo "******************************************"
}

echo "Enter the first, second and third i.e. 1.1.1"
read ip_address
echo "Enter the fourth octet range i.e. start from"
read first
echo "Enter the fourth octet range i.e. end"
read last


function ip_address_right {
        [[ $ip_address =~ ^[0-9.]+$ ]]
}
function ip_address_wrong {
        [[ ! $ip_address =~ ^[0-9.]+$ ]]
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

if [ -z "$ip_address" ] || [ -z "$first" ] || [ -z "$last" ]
then
        if [ -n "$ip_address" ] && [ -z "$first" ] && [ -z "$last" ]
        then
                lines
                echo "Fourth octet range field empty i.e. start from"
                echo "Fourth octet range field empty i.e. end"
        elif [ -n "$ip_address" ] && [ -n "$first" ] && [ -z "$last" ]
        then
                lines
                echo "Fourth octet range field empty i.e. end"
        elif [ -n "$ip_address" ] && [ -z "$first" ] && [ -n "$last" ]
        then
                lines
                echo "Fourth octet range field empty i.e. start from"
        elif [ -z "$ip_address" ] && [ -n "$first" ] && [ -n "$last" ]
        then
                lines
                echo "First,second and third octet field empty"
        elif [ -z "$ip_address" ] && [ -z "$first" ] && [ -n "$last" ]
        then
                lines
                echo "First,second and third octet field empty"
                echo "Fourth octet range field empty i.e. start from"
        elif [ -z "$ip_address" ] && [ -n "$first" ] && [ -z "$last" ]
        then
                lines
                echo "First,second and third octet field empty"
                echo "Fourth octet range field empty i.e. end"
        elif [ -z "$ip_address" ] && [ -z "$first" ] && [ -z "$last" ]
        then
                lines
                echo "First,second and third octet field empty"
                echo "Fourth octet range field empty i.e. start from"
                echo "Fourth octet range field empty i.e. end"
        else
                lines
                echo "Issues with the user input"
        fi
elif [ -n "$ip_address" ] && [ -n "$first" ] && [ -n "$last" ]
then
        if ip_address_wrong || first_wrong || last_wrong
        then
                if ip_address_right && first_wrong && last_wrong
                then
                        lines
                        echo "User input --> Fourth octet --> first range must include numeric values"
                        echo "User input --> Fourth octet --> Last range must include numeric values"
                elif ip_address_right && first_right && last_wrong
                then
                        lines
                        echo "User input --> Fourth octet --> Last range must include numeric values"
                elif ip_address_right && first_last && last_right
                then
                        lines
                        echo "User input --> Fourth octet --> first range must include numeric values"
                elif ip_address_wrong && first_right && last_right
                then
                        lines
                        echo "User input --> First,second,third octet must include numeric values"
                elif ip_address_wrong && first_wrong && last_right
                then
                        lines
                        echo "User input --> First,second,third octet must include numeric values"
                        echo "User input --> Fourth octet --> first range must include numeric values"
                elif ip_address_wrong && first_right && last_wrong
                then
                        lines
                        echo "User input --> First,second,third octet must include numeric values"
                        echo "User input --> Fourth octet --> last range must include numeric values"
                elif ip_address_wrong && first_wrong && last_wrong
                then
                        lines
                        echo "User input --> First,second,third octet must include numeric values"
                        echo "User input --> Fourth octet --> first range must include numeric values"
                        echo "User input --> Fourth octet --> last range must include numeric values"
                else
                        lines
                        echo "Issues with the user input validation"
                fi
        elif ip_address_right && first_right && last_right
        then
                for reverse_lookup in $(seq $first $last)
                do
                        host $ip_address.$reverse_lookup &>/dev/null
                        if [ $? -eq 0 ]
                        then
                                lines
                                host $ip_address.$reverse_lookup
                                sleep 0.2
                                continue
                        else
                                sleep 0.2
                                continue
                        fi

                done
        fi
fi
