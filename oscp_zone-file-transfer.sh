#zone file tarnsfer for oscp

#!/bin/bash

# user input --> ENter the domain
echo "Enter the domain name i.e. google.com"
read domain

function lines {
        echo "*******************************"
}

#check user input is empty or the length of the string is equal to zero
if [ -z "$domain" ]
then
        lines
        echo "Domain field cannot be empty"
else
        host -t ns $domain &>/dev/null
        if [ $? -eq 0 ]
        then
                lines
                echo "******Name servers found --> $domain"
                sleep 1
                host -t ns $domain | cut -d " " -f4 | cut -d "." -f1-3
                if [ $? -eq 0 ]
                then
                        host -t ns $domain | cut -d " " -f4 | cut -d "." -f1-3 > ./name_servers
                        sleep 1
                         if [ -s ./name_servers ]
                         then
                                 lines
                                 echo "Would you like to attempt zone file tarnsfer Y/y or N/n --> $domain"
                                 read option
                                 if [ "$option" == "Y" ] || [ "$option" == "y" ]
                                 then
                                         for zone_transfers in $(cat ./name_servers)
                                         do
                                                host -l $domain $zone_transfers &>/dev/null
                                                if [ $? -eq 0 ]
                                                then
                                                        lines
                                                        host -l $domain $zone_transfers
                                                else
                                                        lines
                                                        echo "Zone file tarnsfer failed --> $zone_transfers"
                                                        continue
                                                fi

                                         done
                                 elif [ "$option" == "N" ] || [ "$option" == "n" ]
                                 then
                                         lines
                                         echo "You chooise to quit, bye"
                                 else
                                         lines
                                         echo "Invalid user input"
                                 fi
                         fi
                fi
        else
                lines
                echo "*********Inavlid hostname --> $domain**********"
        fi
fi
rm -rf ./1
rm -rf ./name_servers
