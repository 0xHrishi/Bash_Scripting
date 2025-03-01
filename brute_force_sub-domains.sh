#!/bin/bash

#script to find out hostnames of a domain by using brute force attack on domain 

#user input i.e. domain name and file path for brute force
echo "Enter the domain i.e. google.com"
read domain
echo "Enter the file i.e. full path for brute force attack"
read filepath

function lines {
        echo "**********************************"
}

#Check user input i.e. domain and filepath 
if [ -z "$domain" ] || [ -z "$filepath" ]
then
        if [ -n "$domain" ] && [ -z "$filepath" ]
        then
                lines
                echo "File path field is empty"
        elif [ -z "$domain" ] && [ -n "$filepath" ]
        then
                lines
                echo "Domain name field is empty"
        elif [ -z "$domain" ] && [ -z "$filepath" ]
        then
                lines
                echo "Domain name field is empty"
                echo "File path field is empty"
        else
                lines
                echo "Issues with the user input"
        fi

#user input is ok i.e. the user input is greather than zero or not empty 
elif [ -n "$domain" ] && [ -n "$filepath" ]
then
        if [ -e $filepath ]
        then
                #check user input ie. filepath is a directory
                if [ -d $filepath ]
                then
                        lines
                        echo "$filepath --> Its a directory"
                        echo "Nothing can be done"

                #user input filepath is file
                elif [ -f $filepath ]
                then

                        #for loop to find out different hostname related to domain
                        for subdomains in $(cat $filepath)
                        do
                                host $subdomains.$domain &>/dev/null
                                if [ $? -eq 0 ]
                                then
                                        lines
                                        host $subdomains.$domain | cut -d " " -f1,4
                                        sleep 0.5
                                else
                                        lines
                                        echo "$subdomains.$domain not found"
                                        sleep 0.5
                                fi
                        done

                else
                        lines
                        echo "$filepath --> File found"
                        echo "Unable to identify the file path"
                fi
        fi
fi
