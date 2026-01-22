#!/bin/bash
# Description : Converts temperatures between Celsius and Fahrenheit

function lines {
        echo "***************************************************************"
}

#color codes for error messages
RED='\033[0;31m'
NF='\033[0m'

# Function to validate Celsius input (integer or decimal, positive or negative)
function celsius_check {
        [[ $celsius =~ ^-?[0-9.]+$ ]]
}
# user input
read -p "Enter the temperature in Celsius: " celsius

# user input empty
if [ -z "$celsius" ]
then
        lines
        echo -e "${RED}User input --> Celsius field is empty${NF}"

# user input not empty
# validation check 
# Convert Celsius to Fahrenheit
else
        lines
        if ! celsius_check
        then
                echo -e "${RED}Celsuis field must contain only numeric values${NF}"
        else
                celsius_to_fahrenheit=$(bc <<< "scale=2; ($celsius * 9 / 5) + 32")
                echo "Celsius --> $celsius"
                echo "Celsius to Fahrenheit --> $celsius_to_fahrenheit"
        fi
fi


echo
echo
# Function to validate Fahrenheit input (integer or decimal, positive or negative)
function fahrenheit_check {
        [[ $fahrenheit =~ ^-?[0-9.]+$ ]]
}
read -p "Enter the temperature in Fahrenheit: " fahrenheit

if [ -z "$fahrenheit" ]
then
        lines
        echo -e "${RED}User input --> Fahrenheit field is empty${NF}"


# user input not empty
# validation check 
# Convert Fahrenheit to Celsius
else
        lines
        if ! fahrenheit_check
        then
                echo -e "${RED}Fahrenheit field must contain only numeric values${NF}"
        else
                fahrenheit_to_celsius=$(bc <<< "scale=2; (5.0 / 9) * ($fahrenheit - 32)")
                echo "Celsius --> $fahrenheit"
                echo "Celsius to Fahrenheit --> $fahrenheit_to_celsius"
        fi
fi
