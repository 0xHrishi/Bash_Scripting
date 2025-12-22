#!/bin/bash
# Basic script to display different ways to ask input from the user

# Function to print a visual separator
function lines {
        echo "*********************************************"
}

# Section 1 - Basic input
echo "Enter the username"
read username
echo "Username is --> $username"

# Section 2 - Using -p option
lines
read -p "Enter the username: " username
echo "Username is --> $username"

# Section 3 - Using -sp option i.e. Sient input mostly used for password like entry
lines
read -sp "Enter the username: " username
echo
echo "Username is --> $username"

# Section 4 - Colored text
lines
RED='\033[0;31m'
RED='\033[0;31;41m'
NC='\033[0m'

read -p "Enter the username: " username
echo -e "${RED}Username is $username${NC}"
echo -e "Username is ${RED}$username${NC}"

# Section 5 - Colored background
RED='\033[0;31;43m'
NC='\033[0m'
read -p "Enter the username: " username
echo -e "${RED}Username is $username${NC}"
echo -e "Username is ${RED}$username${NC}"


########################################################################################################################
#COLOR='\033\text style; font color; background color'

Text 
#0 → Normal
#1 → Bold 
#4 → Underline


#Foreground color codes
#• 30: Black
#• 31: Red
#• 32: Green
#• 33: Yellow
#• 34: Blue
#• 35: Magenta
#• 36: Cyan
#• 37: White

#Background color code
#• 40: Black background
#• 41: Red background
#• 42: Green background
#• 43: Yellow background
#• 44: Blue background
#• 45: Magenta background
#• 46: Cyan background
#• 47: White background
########################################################################################################################

