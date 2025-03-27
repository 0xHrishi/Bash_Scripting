#!/bin/bash
#script for calcation such as addition, subtraction, multiplication, power with case statements

#function for user input
function user_input {
        echo "Enter the first number"
        read first
        echo "Enter the second number"
        read second
}

function lines {
        echo "*********************************"
}

#function for try again i.e. do calculation one more time
function try_again {
        lines
        echo "Would you like to continue.y/n?"
        read choice
        if [ "$choice" == "y" ]
        then
                user_input
                validation_1
                validation_2
        elif [ "$choice" == "n" ]
        then
                lines
                echo "You choose to quit, bye"
                exit
        else
                lines
                echo "Invalid option, bye"
                exit
        fi
}

#function to check first and second number must contain only positive numeric values
function first_right {
        [[ $first =~ ^[0-9]+$ ]]
}
function first_wrong {
        [[ ! $first =~ ^[0-9]+$ ]]
}
function second_right {
        [[ $second =~ ^[0-9]+$ ]]
}
function second_wrong {
        [[ ! $second =~ ^[0-9]+$ ]]
}

#function to check user input
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

#function for calculation
function calculation {
        lines
        echo "Press 1 --> Addition"
        echo "Press 2 --> Subtraction"
        echo "Press 3 --> Multiplication"
        echo "Press 4 --> Power"
        read option

        case $option in
                1)
                        lines
                        sum=$(($first+$second))
                        echo "$first plus $second --> $sum"
                        try_again
                        ;;
                2)
                        lines
                        subtract=$(($first-$second))
                        echo "$first subtract $second --> $subtract"
                        try_again
                        ;;
                3)
                        lines
                        multiply=$(($first*$second))
                        echo "$first multiply $second --> $multiply"
                        try_again
                        ;;
                4)
                        lines
                        power=$(($first**$second))
                        echo "$first power $second --> $power"
                        try_again
                        ;;
                *)
                        lines
                        echo "Issues with the user input"
                        try_again
        esac
}

#function --> user input is not empty
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
                                echo "Issues with user input validation"
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
