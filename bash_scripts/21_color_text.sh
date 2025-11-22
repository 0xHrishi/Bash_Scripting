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
