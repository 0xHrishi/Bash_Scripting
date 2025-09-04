#!/bin/bash

#user provides two numbers i.e. first and second 
#result --> first + second 
#Ask user to enter a new number 
#result + new number 
function lines {
        echo "**************************************"
}

#user input
function user_input {
        read -p "Enter the first number: " first
        read -p "Enter the second number: " second
}

#function to see whther the user input field is empty or not
function validation_1 {
        if [ -z "$first" ] || [ -z "$second" ]
        then
                if [ -n "$first" ] && [ -z "$second" ]
                then
                        lines
                        echo "User input --> Second number field is empty"
                elif [ -z "$first" ] && [ -n "$second" ]
                then
                        lines
                        echo "User input --> First number field is empty"
                elif [ -z "$first" ] && [ -z "$second" ]
                then
                        lines
                        echo "User input --> First number field is empty"
                        echo "User input --> Second number field is empty"
                fi
        fi
}

#user input must contain only numeric values
function first_right {
        [[ $first =~ ^[0-9-]+$ ]]
}
function first_wrong {
        [[ ! $first =~ ^[0-9-]+$ ]]
}
function second_right {
        [[ $second =~ ^[0-9-]+$ ]]
}
function second_wrong {
        [[ ! $second =~ ^[0-9-]+$ ]]
}

#first calculation i.e. first plus second
function calculation {
        sum=$(($first+$second))
        echo "First number:$first plus Second number:$second --> $sum"
        try_again
}

#Ask the user to try again the calculation 
#if Yes, add previous result with new number 
#keep on going, until user provides invalid input or choose to quit 

function try_again {
        lines
        echo "Would you like to add another number to the result ? y/n"
        read choice
        if [ "$choice" == "n" ]
        then
                lines
                echo "You choose t quit, bye"
        elif [ "$choice" == "y" ]
        then
                while [ "$choice" == "y" ]
                do
                        read -p "Enter a new number: " new_number
                        result=$(($sum+$new_number))
                        echo "Previous result:$sum plus New number:$new_number --> $result"
                        sum=$result
                        try_again
                done
        else
                lines
                echo "Invalid user choice"
        fi
}

#function to see whether the user input contain only numeric values
function validation_2 {
        if [ -n "$first" ] && [ -n "$second" ]
        then
                if first_wrong || second_wrong
                then
                        if first_right && second_wrong
                        then
                                lines
                                echo "User input --> Second number must contain only numeric values"
                        elif first_wrong && second_right
                        then
                                lines
                                echo "User input --> First number must contain only numeric values"
                        elif first_wrong && second_wrong
                        then
                                lines
                                echo "User input --> First number must contain only numeric values"
                                echo "User input --> Second number must contain only numeric values"
                        fi
                elif first_right && second_right
                then
                        calculation

                fi
        fi
}

user_input
validation_1
validation_2
