#!/bin/bash
# Prompt for user input i.e. first_number and second_number
# Add the two numbers and display whether the sum is odd or even number 

# Function: Draw a separator line
function lines {
        echo "*************************************************************"
}

# Function -- first_number_check, second_number_check
# Ensures: number does NOT start with zero and is numeric (positive or negative)
function first_number_check {
        [[ $first_number =~ ^[1-9-][0-9]*$ ]]
}
function second_number_check {
        [[ $second_number =~ ^[1-9-][0-9]*$ ]]
}

# Display message -- User input should not start with zero
echo "***** Script add two numbers, Display the sum whether is odd or even *****"
echo "User input must not start with 0"
sleep 1
lines

# Prompt for user input
read -p "Enter the first number: " first_number
read -p "Enter the second number: " second_number

# If user input is empty 
if [ -z "$first_number" ] || [ -z "$second_number" ]
then
        if [ -n "$first_number" ] && [ -z "$second_number" ]
        then
                lines
                echo "User input -- Second number field is empty"
        elif [ -z "$first_number" ] && [ -n "$second_number" ]
        then
                lines
                echo "User input -- First number field is empty"
        elif [ -z "$first_number" ] && [ -z "$second_number" ]
        then
                lines
                echo "User input -- First number field is empty"
                echo "User input -- Second number field is empty"
        fi
        
# Both fields have values → Validate numbers
# Both are valid numbers → Perform addition
elif [ -n "$first_number" ] && [ -n "$second_number" ]
then
        if ! first_number_check || ! second_number_check
        then
                if first_number_check && ! second_number_check
                then
                        lines
                        echo "Second number field must contain only numeric(positive or negative) values"
                elif ! first_number_check && second_number_check
                then
                        lines
                        echo "First number field must contain only numeric(positive or negative) values"
                elif ! first_number_check && ! second_number_check
                then
                        lines
                        echo "First number field must contain only numeric(positive or negative) values"
                        echo "Second number field must contain only numeric(positive or negative) values"
                fi
        elif first_number_check && second_number_check
        then
                lines
                sum=$(($first_number+$second_number))
                echo "First number: $first_number plus Second number: $second_number --> $sum"
                if (($sum%2==0))
                then
                        echo "$sum --> Even number"
                elif (($sum%2!=0))
                then
                        echo "$sum --> Odd number"
                else
                        echo "Something went wrong"
                fi
        fi
fi
