#!/bin/bash
# Prompt user input i.e. username and uid number 
# Verifies the username and uid number in /etc/passwd file 

function lines {
        echo "****************************************************************************"
}

# color codes for error messages
red='\033[0;31m'
nf='\033[0m'


# Function to make sure, the user input must allowed certain values
# username_check -- (alphanumeric only, no special characters)
# uid_number_check -- Only numeric values
function username_check {
        [[ $username =~ ^[a-zA-Z0-9][a-zA-Z0-9]*$ ]]
}
function uid_number_check {
        [[ $uid_number =~ ^[0-9][0-9]*$ ]]
}
# Prompt user input
read -p "Enter the username: " username
read -p "Enter the UID number: " uid_number

# If user input is empty
if [ -z "$username" ] || [ -z "$uid_number" ]
then
        lines
        if [ -z "$username" ]
        then
                echo -e "${red}User input --> username field is empty${nf}"
        fi
        if [ -z "$uid_number" ]
        then
                echo -e "${red}User input --> UID number field is empty${nf}"
        fi

# User input is not empty
# Restrict reserved username and UID ranges
# Check availability in /etc/passwd
elif [ -n "$username" ] && [ -n "$uid_number" ]
then
        if ! username_check || ! uid_number_check
        then
                lines
                if ! username_check
                then
                        echo -e "${red}Username field can contain alphanumeric values, no special characters${nf}"
                fi
                if ! uid_number_check
                then
                        echo -e "${red}UID number field can contain numeric values${nf}"
                fi
        elif username_check && uid_number_check
        then
                if [ "$username" == "root" ] || [ $uid_number -eq 0 ] || [ $uid_number -gt 65500 ]
                then
                        lines
                        if [ "$username" == "root" ]
                        then
                                echo -e "${red}Username cannot be root${nf}"
                        fi
                        if [ $uid_number -eq 0 ]
                        then
                                echo -e "${red}UID number cannot be 0${nf}"
                        fi
                        if [ $uid_number -gt 65500 ]
                        then
                                echo -e "${red}UID number cannot greater than 65000${nf}"
                        fi
                elif [ "$username" != "root" ] && [ $uid_number -ne 0 ] && [ $uid_number -le 65000 ]
                then
                        lines
                        cat /etc/passwd | cut -d ":" -f1 | grep -w $username > ./username_lists
                        cat /etc/passwd | cut -d ":" -f3| grep -w $uid_number > ./uid_number_lists

                        if [ -s ./username_lists ] && [ -s ./uid_number_lists ]
                        then
                                echo "Username not available --> $username"
                                echo "UID number not available --> $uid_number"
                        elif [ ! -s ./username_lists ] && [ -s ./uid_number_lists ]
                        then
                                echo "Username available --> $username"
                                echo "UID number not available --> $uid_number"
                        elif [ -s ./username_lists ] && [ ! -s ./uid_number_lists ]
                        then
                                echo "Username not available --> $username"
                                echo "UID number available --> $uid_number"
                        elif [ ! -s ./username_lists ] && [ ! -s ./uid_number_lists ]
                        then
                                echo "Username available --> $username"
                                echo "UID number available --> $uid_number"
                        fi
                fi
        fi
fi
# Cleanup temporary files
rm -rf ./username_lists
rm -rf ./uid_number_lists
