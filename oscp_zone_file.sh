#!/bin/bash

#zone file transfer for oscp exercise 

function lines {
        echo "**************************************"
}

echo "Script for zone file transfer"
sleep 0.3

read -p "Enter the domain name such as google.com: " domain_name

if [ -z "$domain_name" ]
then
        echo "User input --> Domain name field empty"
else
        lines
        echo "Name servers for the $domain_name"
        host -t ns $domain_name | cut -d " " -f4 | cut -d "." -f1-3
        host -t ns $domain_name | cut -d " " -f4 | cut -d "." -f1-3 > name_server
        lines
        echo "Would you like to attempt zone file transfer ? y/n"
        read option
        if [ "$option" == "n" ]
        then
                lines
                echo "You choose to exit, bye"
        elif [ "$option" == "y" ]
        then
                for zone_transfer in $ $(cat name_server)
                do
                        host -l $domain_name $zone_transfer &>/dev/null

                        if [ $? -eq 0 ]
                        then
                                lines
                                host -l $domain_name $zone_transfer
                        else
                                sleep 0.2
                                continue
                        fi

                done
        else
                lines
                echo "Invalid user input"
        fi

fi
rm -rf ./1
rm -rf ./name_server
