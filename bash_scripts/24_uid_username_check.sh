#!/bin/bash

# Check username and uid number is available for use

function lines {
        echo "**************************************"
}

# color codes for error
RED='\033[1;31m'
NF='\033[0m'

# function to check username i.e. can be alphanumeric but must start with aplhabet
# uid number must contain only numeric values except 0
function username_check {
        [[ $username =~ ^[a-z][a-zA-Z0-9]*$ ]]
}
function uid_number_check {
        [[ $uid_number =~ ^[1-9][0-9]*$ ]]
}

# user input
read -p "Enter the username: " username
read -p "Enter the uid number except 0: " uid_number


# user input empty
if [ -z "$username" ] || [ -z "$uid_number" ]
then
        lines
        if [ -z "$username" ]
        then
                echo -e "${RED}User input --> Username field is empty${NF}"
        fi
        if [ -z "$uid_number" ]
        then
                echo -e "${RED}User input --> UID number field is empty${NF}"
        fi

# user input not empty
# validate user input
# validation passed -- check whether username and uid number is available for next use
# Check username and uid number availability

elif [ -n "$username" ] && [ -n "$uid_number" ]
then
        lines
        if ! username_check || ! uid_number_check
        then
                if ! username_check
                then
                        echo -e "${RED}Username field must contain only alphanumeric values starting with alphabet"
                fi
                if ! uid_number_check
                then
                        echo -e "${RED}UID number field must contain only numeric values"
                fi
        elif username_check && uid_number_check
        then
                if [ "$username" != "root" ] && [ "$uid_number" -gt 0 ] && [ "$uid_number" -le 65000 ]
                then
                        cat /etc/passwd | cut -d ":" -f1 | grep -w "$username" > ./username_lists
                        cat /etc/passwd | cut -d ":" -f3 | grep -w "$uid_number" > ./uid_number_lists

                        if [ -s ./username_lists ]
                        then
                                echo -e "${RED}Username is not available --> $username${NF}"
                        fi
                        if [ ! -s ./username_lists ]
                        then
                                echo -e "Username is available --> $username"
                        fi
                        if [ -s ./uid_number_lists ]
                        then
                                echo -e "${RED}UID number is not available --> $uid_number${NF}"
                        fi
                        if [ ! -s ./uid_number_lists ]
                        then
                                echo -e "UID is available --> $uid_number"
                        fi

                elif [ "$username" == "root" ] || [ "$uid_number" -eq 0 ] || [ "$uid_number" -gt 65000 ]
                then
                        if [ "$username" == "root" ]
                        then
                                echo -e "${RED}Username cannot be root${NF}"
                        fi
                        if [ "$uid_number" -gt 65000 ]
                        then
                                echo -e "${RED}UID number cannot be greater than 65000${NF}"
                        fi
                fi
        fi
fi
# Cleanup temporary files
rm -rf ./username_lists
rm -rf ./uid_number_lists
