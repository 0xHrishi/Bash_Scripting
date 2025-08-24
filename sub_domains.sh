#!/bin/bash
#Brute force attack on domain to find different hostname 
function lines {
        echo "*********************************************"
}

#user input
read -p "Enter the domain such as google.com: " domain_name
read -p "Enter the filepath for brute force attack: " filepath

#check any user input missing
if [ -z "$domain_name" ] ||  [ -z "$filepath" ]
then
        if [ -n "$domain_name" ] &&  [ -z "$filepath" ]
        then
                lines
                echo "User input --> Filepath field is empty"
        elif [ -z "$domain_name" ] &&  [ -n "$filepath" ]
        then
                lines
                echo "User input --> Domain name field is empty"
        elif [ -z "$domain_name" ] &&  [ -z "$filepath" ]
        then
                lines
                echo "User input --> Domain name field is empty"
                echo "User input --> Filepath field is empty"
        fi

#user supplied input
#check the filepath is a regular file or directory
#If regular file, brute force attack on domain 
#resolves the domain to IP address which indicates its a functional server 

elif [ -n "$domain_name" ] &&  [ -n "$filepath" ]
then
        if [ -e $filepath ]
        then
                if [ -d $filepath ]
                then
                        lines
                        echo "Its a directory --> $filepath"
                elif [ -f $filepath ] && [ -s $filepath ]
                then
                        for sub_domains in $(cat $filepath)
                        do
                                host $sub_domains.$domain_name &>/dev/null

                                if [ $? -eq 0 ]
                                then
                                        lines
                                        host $sub_domains.$domain_name
                                        sleep 0.3
                                else
                                        lines
                                        echo "$sub_domains.$domain_name not found"
                                        sleep 0.3
                                fi

                        done

                else
                        lines
                        echo "File found, unable to identify the file type --> $filepath"
                fi
        else
                lines
                echo "File not found --> $filepath"
        fi
fi
