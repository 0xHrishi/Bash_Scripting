#!/bin/bash

#script for calculation i.e. add, subtract, multiply, power


#function to ask for user input i.e. first and second number
function user_input {
        echo "Enter the first number"
        read first

        echo "Enter the second number"
        read second
}

#function try_again, if user input is invalid or after successfull calculation,try again the operation 
function try_again {
        lines
        echo "Would you like to try again Y/y or N/n ?"
        read again

        #calculation will perform once again 
        if [ "$again" == "Y" ] || [ "$again" == "y" ]
        then
                lines
                user_input
                validation_1
                validation_2

        #script stop as the user would like not to continue with calculation
        elif [ "$again" == "N" ] || [ "$again" == "n" ]
        then
                lines
                echo "You choose to quit, Bye"
                exit
        else
                lines
                echo "Invalid user input, Bye"
                exit
        fi
}

function lines {
        echo "********************************"
}

#function to check, first number must contain only numeric values
function first_right {
        [[ $first =~ ^[0-9]+$ ]]
}
function first_wrong {
        [[ ! $first =~ ^[0-9]+$ ]]
}

#function to check, second number must contain only numeric values
function second_right {
        [[ $second =~ ^[0-9]+$ ]]
}
function second_wrong {
        [[ ! $second =~ ^[0-9]+$ ]]
}

#function to check the user input i.e whether they are empty or length of the string is equal to zero
function validation_1 {
        if [ -z "$first" ] || [ -z "$second" ]
        then
                if [ -n "$first" ] && [ -z "$second" ]
                then
                        lines
                        echo "Second number field is empty"
                        try_again
                elif [ -z "$first" ] && [ -n "$second" ]
                then
                        lines
                        echo "First number field is empty"
                        try_again
                elif [ -z "$first" ] && [ -z "$second" ]
                then
                        lines
                        echo "First number field is empty"
                        echo "Second number field is empty"
                        try_again
                else
                        lines
                        echo "Issues with the user input"
                        try_again
                fi
        fi
}

#function to perform calculation
function calculation {
        lines
        echo "Enter 1 --> Addition"
        echo "Enter 2 --> Subtraction"
        echo "Enter 3 --> Multiplication"
        echo "Enter 4 --> Power"
        read option

        case $option in
                1)
                        lines
                        result=$(($first+$second))
                        echo "First i.e. $first plus Second i.e. $second --> $result"
                        try_again
                        ;;
                2)
                        lines
                        result=$(($first-$second))
                        echo "First i.e. $first minus Second i.e. $second --> $result"
                        try_again
                        ;;
                3)
                        lines
                        result=$(($first*$second))
                        echo "First i.e. $first multiply Second i.e. $second --> $result"
                        try_again
                        ;;
                4)
                        lines
                        result=$(($first**$second))
                        echo "First i.e. $first power Second i.e. $second --> $result"
                        try_again
                        ;;
                *)
                        lines
                        echo "Issues with the user input"
                        try_again
                        ;;
        esac
}

#function to check whether the user input contain only numeric values, if doesnt then display error
function validation_2 {
        if [ -n "$first" ] && [ -n "$second" ]
        then
                if first_wrong || second_wrong
                then
                        if first_right && second_wrong
                        then
                                lines
                                echo "Second number field must contain only numeric values"
                                try_again
                        elif first_wrong && second_right
                        then
                                lines
                                echo "First number field must contain only numeric values"
                                try_again
                        elif first_wrong && second_wrong
                        then
                                lines
                                echo "First number field must contain only numeric values"
                                echo "Second number field must contain only numeric values"
                                try_again
                        else
                                lines
                                echo "Issues with the user input validation"
                                try_again
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
