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


function lines {
        echo "*************************************************************"
}
# Checks if the password contains at least one uppercase letter (A-Z)
function uppercase {
        [[ $password =~ [A-Z] ]]
}
# Checks if the password contains at least one lowercase letter (a-z)
function lowercase {
        [[ $password =~ [a-z] ]]
}
# Checks if the password contains at least one numeric digit (0‑9)
function numeric {
        [[ $password =~ [0-9] ]]
}
# Checks if the password contains at least one special characters
function special_characters {
        [[ $password =~ [\!\@\#\$\%\^\&\*] ]]
}

# Prompt user input
# Silent prompt so password does not appear on the screen
read -sp "Enter the password: " password
echo

# Empty user input
if [ -z "$password" ]
then
        lines
        echo "User input --> Password field is empty"

# Check for uppercase & lowercase letters, digits and special characters
# Display the final score 
elif [ -n "$password" ]
then
        strength=0
        if uppercase
        then
                ((strength++))
        fi

        if lowercase
        then
                ((strength++))
        fi

        if numeric
        then
                ((strength++))
        fi

        if special_characters
        then
                ((strength++))
        fi

echo "Strength of the password --> $strength"

fi
