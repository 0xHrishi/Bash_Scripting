#!/bin/bash
# Simple interactive addition script
# Accepts two integers (positive or negative, no leading zero)
# Adds them
# Allows the user to keep adding numbers to the result

function lines {
        echo "****************************************************************************"
}

# Color codes for error messages
red='\033[0;31m'
nf='\033[0m'

# Function to check, the user input must contain only numeric values
function first_number_check {
        [[ $first_number =~ ^[1-9-][0-9]*$ ]]
}
function second_number_check {
        [[ $second_number =~ ^[1-9-][0-9]*$ ]]
}
function new_number_check {
        [[ $new_number =~ ^[1-9-][0-9]*$ ]]
}

# Function to repeatedly ask user if they want to add another number
# If no --> exit
function try_again {
        lines
        read -p "Would you like to add a new number to the previous result ? y/n: " choice

        if [ "$choice" == "y" ]
        then
                read -p "Enter a new number: " new_number
                if ! new_number_check
                then
                        echo -e "${red}New number field must contain only numeric values i.e. positive or negative${nf}"
                        try_again
                fi
                if new_number_check
                then
                        new_sum=$(($sum+$new_number))
                        echo "Previous resumt: $sum plus $new_number --> $new_sum"
                        sum=$new_sum

                        try_again
                fi
        elif [ "$choice" == "n" ]
        then
                echo "User would like to quit"
                exit
        else
                echo "Invalid user input"
                exit
        fi
}

# Inform user about input rules
echo "*****User input must not start with zero i.e. 01, 001, 0001 etc.*****"
sleep 0.2
# Prompt user input
read -p "Enter the first number: " first_number
read -p "Enter the seccond number: " second_number

# User input empty
if [ -z "$first_number" ] || [ -z "$second_number" ]
then
        lines
        if [ -z "$first_number" ]
        then
                echo -e "${red}User input --> First number field is empty"
        fi
        if [ -z "$second_number" ]
        then
                echo -e "${red}User input --> Second number field is empty"
        fi

# User input not empty
# Valudate the user input i.e. must contain numeric values
# Function -- try_again, Ask user if they want to continue adding numbers
elif [ -n "$first_number" ] && [ -n "$second_number" ]
then
        if ! first_number_check || ! second_number_check
        then
                lines
                if ! first_number_check
                then
                        echo -e "${red}First number field must contain numeric values i.e. positive or negative${nf}"
                fi
                if ! second_number_check
                then
                        echo -e "${red}Second number field must contain numeric values i.e. positive or negative${nf}"
                fi
        elif first_number_check && second_number_check
        then
                lines
                sum=$(($first_number+$second_number))
                echo "First number: $first_number plus Second number: $second_number --> $sum"
                try_again

        fi
fi
