#!/bin/bash

#Two numbers from user input --> first and second 
#Add the two numbers and check whether the result is odd or even numbers


#First number from user
echo "Enter the first number"
read first

#second number from user
echo "Enter the second number"
read second

#created function
function lines {
        echo "****************************************"
}

#created function to make sure the first number must be only numeric values 
function first_right {
        [[ $first =~ ^[0-9-]+$ ]]
}
function first_wrong {
        [[ ! $first =~ ^[0-9-]+$ ]]
}

#created function to make sure the Second number must be only numeric values 
function second_right {
        [[ $second =~ ^[0-9-]+$ ]]
}
function second_wrong {
        [[ ! $second =~ ^[0-9-]+$ ]]
}

#If statement to check --> If the user input is empty i.e. the length of the string is equal to zero
if [ -z "$first" ] || [ -z "$second" ]
then
        if [ -n "$first" ] && [ -z "$second" ]
        then
                lines
                echo "Second number field is empty"
        elif [ -z "$first" ] && [ -n "$second" ]
        then
                lines
                echo "First number field is empty"
        elif [ -z "$first" ] && [ -z "$second" ]
        then
                lines
                echo "First number field is empty"
                echo "Second number field is empty"
        else
                lines
                echo "Issues with the user input"
        fi
#Statement when the user has provided input i.e. first and second number 
#If statemennt within elif statement to check whether the input provided by the user is valid i.e. contain only nuemric values
#If the user input do not contain numeric values, display error
#If the user input contain only numeric values, than proceed with additon i.e. first+second and check whether the result is odd or even

elif [ -n "$first" ] && [ -n "$second" ]
then
        if first_wrong || second_wrong
        then
                if first_right && second_wrong
                then
                        lines
                        echo "Second number field must contain only numeric values"
                elif first_wrong && second_right
                then
                        lines
                        echo "First number field must contain only numeric values"
                elif first_wrong && second_wrong
                then
                        lines
                        echo "First number field must contain only numeric values"
                        echo "Second number field must contain only numeric values"
                else
                        lines
                        echo "Issues with user input validation"
                fi
        elif first_right && second_right
        then
                lines
                echo "First number --> $first"
                echo "Second number --> $second"
                sum=$(($first+$second))
                if (($sum%2==0))
                then
                        echo "$first plus $second --> $sum"
                        echo "$sum --> Even number"
                elif (($sum%2!=0))
                then
                        echo "$first plus $second --> $sum"
                        echo "$sum --> Odd number"
                else
                        echo "Issues with calculation"
                fi
        fi
fi

