#!/bin/bash

# ---------------------------------------------------------------
# Password Strength Checker Script
# ---------------------------------------------------------------
# This script evaluates the strength of a user-entered password.
# It checks the presence of:
# - Uppercase letters
# - Lowercase letters
# - Numeric digits
# - Special characters (! @ # $ % ^ & *)
# Each category contributes 1 point to the total strength score.

#!/bin/bash

function lines {
        echo "****************************************************************"
}
# Color codes for error messages
red='\033[0;31m'
nf='\033[0m'

# Check for at least one uppercase letter
# Check for at least one lowercase letter
# Check for at least one numeric
# Check for at least one special character
function uppercase {
        [[ $passwd =~ [A-Z] ]]
}
function lowercase {
        [[ $passwd =~ [a-z] ]]
}
function numbers {
        [[ $passwd =~ [0-9] ]]
}
function special_characters {
        [[ $passwd =~ [\`\!\@\#\$\%\^\&\*\(\)\_\+\] ]]
}

# Prompt user input
read -sp "Enter the password: " passwd

# User input empty
if [ -z "$passwd" ]
then
        lines
        echo -e "${red}User input --> Password field is empty${nf}"

# If user input is provided
# Password length validation
# If password length is valid, evaluate strength
elif [ -n "$passwd" ]
then
        lines
        password_strength=0
        if [ "${#passwd}" -lt 8 ]
        then
                echo "Password is too weak as its less than 8 characters"

        elif [ "${#passwd}" -ge 8 ]
        then
                ((password_strength++))
                if uppercase
                then
                        ((password_strength++))
                fi
                if lowercase
                then
                        ((password_strength++))
                fi
                if numbers
                then
                        ((password_strength++))
                fi
                if special_characters
                then
                        ((password_strength++))
                fi
        fi
        echo "Password length is greater than 8 characters"
        echo "Password strength points --> $password_strength "
fi
