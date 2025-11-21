#!/bin/bash

#Declare a variable called array_1
array_1=("a" "b" "c" "d" 35)

#print all the values inside array
echo "${array_1[@]}"
#retirve the array as per the index value. Index starts from 0
echo "${array_1[0]}"
#Array slicing 
echo "${array_1[@]:0:4}"

#Add a new value i.e. append 
array_1+=(36 37)
echo "${array_1[@]}"

#add a new value as per index
array_1[0]=(40)
echo "${array_1[@]}"
#Replace an existing value with new value as per the index
array_1[0]=39
echo "${array_1[@]}"

#Insert values into a array via user input
echo "Enter the number"
read number

array_1+=("$number")
echo "${array_1[@]}"

#remove values from an array based upon the index position
unset array_1[0]
echo "${array_1[@]}"

--------------------------------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash
################################################################################################
# Description : This script collects user input and stores values inside an
#               array. The user can repeatedly add more values until choosing
#               to quit.
# Features:
#   - Accepts space-separated values and stores them in an array
#   - Checks if the initial input is empty
#   - Allows repeated insertion using a controlled loop
#   - Displays array contents after every insertion
################################################################################################

#!/bin/bash
#  Prints a decorative separator line for better readability
function lines {
        echo "**********************************************************************"
}


# -----------------------------------------------------------------------------
# Function: try_again
# Purpose : Asks the user whether they want to add more values to the array.
# -----------------------------------------------------------------------------

function try_again {
        lines
        read -p "Would you like to add new values to an array y/n?: " choice
        if [ "$choice" == "n" ]
        then
                lines
                echo "You choose to quit, bye for now"
        elif [ "$choice" == "y" ]
        then
                read -p "Enter the new values: " new_values
                my_array+=($new_values)
                echo "All values inside array --> ${my_array[@]}"
                try_again
        else
                lines
                echo "Invalid user input, try again"
                try_again
        fi
}


# -----------------------------------------------------------------------------
# Main Program Starts Here
# Ask user for initial values
# -----------------------------------------------------------------------------
my_array=()
read -p "Enter the values to be inserted inside array: " user_input

# Check for empty input
if [ -z "$user_input" ]
then
        lines
        echo "User input -- Field is empty"

# User input --ok 
# Insert values to the array
 
elif [ -n "$user_input" ]
then
        lines
        my_array+=($user_input)
        echo "All values inside array --> ${my_array[@]}"
        try_again
fi



