#!/bin/bash
#script --> Brute force to find hostname related to domain 

#user input i.e. domain name and filepath which consits for most common sub domains lists
echo "Enter the domain name i.e. google.com"
read domain
echo "Enter the file path for brute force attack on domain"
read filepath

function lines {
        echo "************************************"
}

#user input empty
if [ -z "$domain" ] || [ -z "$filepath" ]
then
        if [ -n "$domain" ] && [ -z "$filepath" ]
        then
                lines
                echo "Filepath field is empty"
        elif [ -z "$domain" ] && [ -n "$filepath" ]
        then
                lines
                echo "Domain name field is empty"
        elif [ -z "$domain" ] && [ -z "$filepath" ]
        then
                lines
                echo "Domain name field is empty"
                echo "Filepath field is empty"
        else
                lines
                echo "Issues with the user input"
        fi

#user input not empty
elif [ -n "$domain" ] && [ -n "$filepath" ]
then
        if [ -f $filepath ]
        then
                #for loop 
                for sub_domains in $(cat $filepath)
                do
                        host $sub_domains.$domain &>/dev/null

                        if [ $? -eq 0 ]
                        then
                                lines
                                host $sub_domains.$domain | cut -d " " -f1,4
                                host $sub_domains.$domain | cut -d " " -f1,4 >> ./sub_domains_lists
                                sleep 0.5
                        else
                                lines
                                echo "$sub_domains.$domain not found"
                                host $sub_domains.$domain | cut -d " " -f1,4 >> ./sub_domains_lists
                                continue
                                sleep 0.5
                        fi
                done
        elif [ -d $filepath ]
        then
                lines
                echo "$filepath --> Its a directory"
                echo "Nothing can be done"
        else
                lines
                echo "$filepath --> Unable to find"
        fi
fi
rm -rf ./1
