#brute force standard search
#allows the user to brute force a domain in order to find different hostname of a domain
# a file contain a wordlit of most popular hostname

#!/bin/bash

echo "Enter the domain i.e. google.com"
read domain
echo "Enter the path for brute force to discover sub-domains"
read file


if [ -z "$domain" ] || [ -z "$file" ]
then
        if [ -n "$domain" ] && [ -z "$file" ]
        then
                echo "*************************************"
                echo "File path field is empty"
        elif [ -z "$domain" ] && [ -n "$file" ]
        then
                echo "*************************************"
                echo "Domain field is empty"
        elif [ -z "$domain" ] && [ -z "$file" ]
        then
                echo "*************************************"
                echo "Domain field is empty"
                echo "File path field is empty"
        else
                echo "*************************************"
                echo "Issues with the user input"
        fi
elif [ -n "$domain" ] && [ -n "$file" ]
then
        if [ -e $file ]
        then
                if [ -f $file ] && [ -s $file ]
                then
                        for sub_domains in $(cat $file)
                        do
                                host $sub_domains.$domain &>/dev/null
                                if [ $? -eq 0 ]
                                then
                                        echo "**************************************"
                                        host $sub_domains.$domain | cut -d " " -f1,4 | awk '{print $1 " --> " $2}'
                                        sleep 0.5
                                else
                                        echo "**************************************"
                                        echo "$sub_domains.$domain not found"
                                        sleep 0.5
                                fi

                        done
                elif [ -d $file ]
                then
                        echo "****************************************"
                        echo "Its a directory"
                else
                        echo "****************************************"
                        echo "Unable to identify the file type"
                fi

        else
                echo "****************************************"
                echo "Invalid file location"
        fi
fi
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#brute force standard search
#allows the user to brute force a domain in order to find different hostname of a domain
# a file contain a wordlit of most popular hostname

#!/bin/bash

echo "Enter the domain name"
read domain
echo "Enter the file path"
read filepath

if [ -z "$domain" ] || [ -z "$filepath" ]
then
        if [ -n "$domain" ] && [ -z "$filepath" ]
        then
                echo "*********************************"
                echo "File path field is empty"
        elif [ -z "$domain" ] && [ -n "$filepath" ]
        then
                echo "*********************************"
                echo "Domain field is empty"
        elif [ -z "$domain" ] && [ -z "$filepath" ]
        then
                echo "*********************************"
                echo "Domain field is empty"
                echo "File field field is empty"
        else
                echo "*********************************"
                echo "Issues with the user input"
        fi
elif [ -n "$domain" ] && [ -n "$filepath" ]
then
        if [ -e $filepath ]
        then
                if [ -f $filepath ]
                then
                        for sub_domains in $(cat $filepath)
                        do
                                host $sub_domains.$domain &>/dev/null
                                if [ $? -eq 0 ]
                                then
                                        echo "*****************************************"
                                        echo "$sub_domains.$domain found"
                                        host $sub_domains.$domain 2>/dev/null
                                        sleep 0.5
                                else
                                        echo "*****************************************"
                                        echo "$sub_domains.$domain not found"
                                        sleep 0.5
                                fi
                        done
                elif [ -d $filepath ]
                then
                        echo "****************************************"
                        echo "Its a directory nothing can be done"
                else
                        echo "****************************************"
                        echo "Inavlid file type"
                fi
        else
                echo "****************************************"
                echo "File not found"
        fi
fi
--------------------------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash

echo "Enter the domain name i.e. mega.com"
read domain
echo "Enter the file path for brute force"
read file


function lines {
        echo "****************************************"
}
if [ -z "$domain" ] || [ -z "$file" ]
then
        if [ -n "$domain" ] && [ -z "$file" ]
        then
                lines
                echo "File path field is empty"
        elif [ -z "$domain" ] && [ -n "$file" ]
        then
                lines
                echo "Domain name field is empty"
        elif [ -z "$domain" ] && [ -z "$file" ]
        then
                lines
                echo "Domain name field is empty"
                echo "File path field is empty"
        else
                lines
        fi
elif [ -n "$domain" ] && [ -n "$file" ]
then
        if [ -e $file ]
        then
                if [ -d $file ]
                then
                        lines
                        echo "$file --> its a directory"
                elif [ -f $file ]
                then
                        for sub_domains in $(cat $file)
                        do
                                host $sub_domains.$domain &>/dev/null
                                if [ $? -eq 0 ]
                                then
                                        lines
                                        host $sub_domains.$domain | grep -iw "has address" | awk '{print $1 " --> " $4}'
                                        sleep 0.5
                                else
                                        lines
                                        echo "$sub_domains.$domain --> not found"
                                        sleep 0.5
                                fi
                        done
                else
                        lines
                        echo "$file --> Unable to identify the file type"
                fi
        else
                lines
                echo "File not found"
        fi

fi






