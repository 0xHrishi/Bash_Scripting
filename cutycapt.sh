#!/bin/bash                                                                                                                                                          

#Once user has find sub domains related to domain, whether the sub domains respond or not, created a bash script which automate the process using cuycapt 

echo "Enter the file path"                                                                                                                                           
read file                                                                                                                                                            

if [ -z "$file" ]
then
        echo "*************************************"
        echo "File path field is empty"

else
        if [ -s $file ]
        then
                if [ -d $file ]
                then
                        echo "*******************************"
                        echo "$file --> Directory"
                        echo "Nothing can be done"
                elif [ -f $file ]
                then
                        mkdir screenshot
                        for sub_domains in $(cat $file)
                        do
                                cutycapt --url=$sub_domains --out=./screenshot/$sub_domains.png
                                sleep 0.5
                        done
                fi
        fi
fi
