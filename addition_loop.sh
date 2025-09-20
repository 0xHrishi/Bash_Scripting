#!/bin/bash

#User input two numbers i.e. first_number and second_number 
#Sum is displayed 
#Script ask user to enter a new number which will get added into the previous sum
#script will keep on running, until the user would like to quit 

function lines {
        echo "*************************************************"
}

#Function to make sure the user input i.e. first_number, second_number and new_number must contain only numeric values
function first_number_right {
        [[ $first_number =~ ^[0-9-]+$ ]]
}
function first_number_wrong {
        [[ ! $first_number =~ ^[0-9-]+$ ]]
}
function second_number_right {
        [[ $second_number =~ ^[0-9-]+$ ]]
}
function second_number_wrong {
        [[ ! $second_number =~ ^[0-9-]+$ ]]
}
function new_number_right {
        [[ $new_number =~ ^[0-9-]+$ ]]
}
function new_number_wrong {
        [[ ! $new_number =~ ^[0-9-]+$ ]]
}

#Funtion if user would like to enter a new number which get added to previous result 
#If user would like to continue, then the script will ask the user to enter a new number which will get added with previous sum 
#If user does not want to continue or user provides invalid input, the script ends. 
function try_again {
        echo "Would you like to enter a new number and add into result y/n?"
        read choice

        if [ "$choice" == "n" ]
        then
                lines
                echo "You choose to quit"
        elif [ "$choice" == "y" ]
        then
                lines
                read -p "Enter a new number: " new_number
                if new_number_right
                then
                        result=$(($new_number+$sum))
                        echo "Previous result:$sum plus new number:$new_number --> $result"
                        sum=$result
                        try_again
                elif new_number_wrong
                then
                        lines
                        echo "User input --> New number must contain only numeric values"
                        try_again
                fi

        else
                lines
                echo "Invalid user input"
        fi

}

#user input --> First and second number
read -p "Enter the first number:" first_number
read -p "Enter the second number:" second_number

#check whether the user input is empty or not
if [ -z "$first_number" ] || [ -z "$second_number" ]
then
        if [ -n "$first_number" ] && [ -z "$second_number" ]
        then
                lines
                echo "User input --> Second number field is empty"
        elif [ -z "$first_number" ] && [ -n "$second_number" ]
        then
                lines
                echo "User input --> First number field is empty"
        elif [ -z "$first_number" ] && [ -z "$second_number" ]
        then
                lines
                echo "User input --> First number field is empty"
                echo "User input --> Second number field is empty"
        fi

#User input is not empty
#Also check whether the user provided only numeric values instead of sepcial characters or alphabets
elif [ -n "$first_number" ] && [ -n "$second_number" ]
then
        if first_number_wrong || second_number_wrong
        then
                if first_number_right && second_number_wrong
                then
                        lines
                        echo "User input --> Second number field must contaon only numeric values"
                elif first_number_wrong && second_number_right
                then
                        lines
                        echo "User input --> First number field must contaon only numeric values"
                elif first_number_wrong && second_number_wrong
                then
                        lines
                        echo "User input --> First number field must contaon only numeric values"
                        echo "User input --> Second number field must contaon only numeric values"
                fi
        elif first_number_right && second_number_right
        then
                lines
                sum=$(($first_number+$second_number))
                echo "First number:$first_number plus Second number:$second_number --> $sum"
                try_again
        fi

fi

