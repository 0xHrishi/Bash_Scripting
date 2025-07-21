#!/bin/bash

function lines {
        echo "******************************************"
}

echo "Enter the hostname such as google.com"
read domain
echo "Enter the file path for brute force"
read file

if [ -z "$domain" ] || [ -z "$file" ]
then
        if [ -n "$domain" ] && [ -z "$file" ]
        then
                lines
                echo "File field empty"
        elif [ -z "$domain" ] && [ -n "$file" ]
        then
                lines
                echo "Domain name field empty"
        elif [ -z "$domain" ] && [ -z "$file" ]
        then
                lines
                echo "Domain name field empty"
                echo "File field empty"
        else
                lines
                echo "Issues with the user input"
        fi
elif [ -n "$domain" ] && [ -n "$file" ]
then
        if [ -e $file ]
        then
                if [ -d $file ]
                then
                        lines
                        echo "$file --> Its a directory"
                        echo "Nothing can be done"
                elif [ -s $file ] && [ -f $file ]
                then
                        for sub_domains in $(cat $file)
                        do
                                host $sub_domains.$domain &>/dev/null
                                if [ $? -eq 0 ]
                                then
                                        lines
                                        host $sub_domains.$domain
                                        host $sub_domains.$domain >> sub_domains
                                        sleep 0.2
                                        continue
                                else
                                        lines
                                        echo "$sub_domains.$domain --> NO PUBLIC DNS RECORDS"
                                        sleep 0.2
                                        continue
                                fi
                        done
                else
                        lines
                        echo "$file found"
                        echo "Unable to identify the file path"
                fi
        else
                lines
                echo "$file --> Not found"
                echo "Invalid file path"
        fi
fi
rm -rf ./1
