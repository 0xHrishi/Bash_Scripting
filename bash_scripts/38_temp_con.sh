#!/bin/bash

# simple bash script to convert the temp from celsius to fahrenheit and vice versa

function lines {
        echo "*****************************************"
}

# color codes for error messages
RED='\033[1;31m'
NF='\033[0m'

# function to validate user input
function celsius_check {
        [[ $celsius =~ ^-?[0-9.]+$ ]]
}
function fahrenheit_check {
        [[ $fahrenheit =~ ^-?[0-9.]+$ ]]
}

# display message
echo -e "${RED}From Celsius to Fahrenheit${NF}"
lines
# user input
read -p "Enter the temperature in celsius: " celsius

# user input empty
if [ -z "$celsius" ]
then
        lines
        echo -e "${RED}User input --> Celsius field is empty${NF}"
# user input not empty
# validate user input
# validation pass, convert the temp
else
        lines
        if ! celsius_check
        then
                echo -e "${RED}Celsius field must contain only numeric values${NF}"
        else
                celsius_to_fahrenheit=$(bc <<< "scale=2; ($celsius * 9 / 5) + 32")
                echo "Temp in Celsius --> $celsius"
                echo "Temp in Fahrenheit --> $celsius_to_fahrenheit"
        fi
fi

lines
# display message
echo -e "${RED}From Fahrenheit to Celsius${NF}"
sleep 0.2
# user input
read -p "Enter the temperature in fahrenheit: " fahrenheit
if [ -z "$fahrenheit" ]
then
        lines
        echo -e "${RED}User input --> Fahrenheit field is empty${NF}"

# user input not empty
# validate user input
# validation pass, convert the temp
else
        if ! fahrenheit_check
        then
                lines
                echo -e "${RED}Fahrenheit field must contain only numeric values${NF}"
        else
                fahrenheit_to_celsius=$(bc <<< "scale=2; (5.0 / 9) * ($fahrenheit - 32)")
                echo "Temp in Fahrenheit --> $fahrenheit"
                echo "Temp in Fahrenheit --> $fahrenheit_to_celsius"
        fi
fi
