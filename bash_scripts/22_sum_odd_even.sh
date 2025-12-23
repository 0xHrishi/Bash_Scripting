#!/bin/bash
# Accept two numbers from the user
# Validate the user input
# Calculate the sum of the two numbers
# Based upon the sum, display whether it is an even or odd number 

function lines {
        echo "****************************************************************************"
}

# Color codes for error messages
red='\033[0;31m'
nf='\033[0m'

# Function to check, that the user input must contain only numeric values i.e. postive or negative
function first_number_check {
        [[ $first_number =~ ^[1-9-][0-9]*$ ]]
}
function second_number_check {
        [[ $second_number =~ ^[1-9-][0-9]*$ ]]
}

# Display a warning 
echo "*****User input should not start with zero i.e. 0, 01, 001 ..*****"
sleep 0.2
lines
# Prompt user input
read -p "Enter the first number: " first_number
read -p "Enter the second number: " second_number

# If user input is empty
if [ -z "$first_number" ] || [ -z "$second_number" ]
then
        lines
        if [ -z "$first_number" ]
        then
                echo -e "${red}User input --> First number field is empty${nf}"
        fi
        if [ -z "$second_number" ]
        then
                echo -e "${red}User input --> Second number field is empty${nf}"
        fi

# User input is not empty
# Validate the user input
# Once the user input is numeric, calculate the sum
# Based upon the sum, display whether it is even or odd number
elif [ -n "$first_number" ] && [ -n "$second_number" ]
then
        if ! first_number_check || ! second_number_check
        then
                lines
                if ! first_number_check
                then
                        echo -e "${red}First number must contain only numeric values i.e. postive or negative numbers${nf}"
                fi
                if ! second_number_check
                then
                        echo -e "${red}Second number must contain only numeric values i.e. positive or negative numbers${nf}"
                fi
        elif first_number_check && second_number_check
        then
                lines
                sum=$(($first_number+$second_number))
                if (($sum%2==0))
                then
                        echo "First number: $first_number plus Second number: $second_number --> $sum"
                        echo "Result is Even number"
                elif (($sum%2!=0))
                then
                        echo "First number: $first_number plus Second number: $second_number --> $sum"
                        echo "Result is Odd number"
                fi

        fi
fi
