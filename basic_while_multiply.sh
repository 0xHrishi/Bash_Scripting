#Basic while loop: User inputs the first number, multiplier, and stop number. 
#The first number is then multiplied by the multiplier until reaching the stop number
#if the result of multiplication i.e. first times $multiplier is greater than stop_number .. nothing to do
#or else do the multiplication until the result is less than stop_number

#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the multiplier number"
read multiplier
echo "Enter the stop number"
read stop_number


if [ -z "$first" ] || [ -z "$multiplier" ] || [ -z "$stop_number" ]
then
        if [ -n "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "**************************************"
                echo "Multiplier number field empty"
                echo "Stop number field empty"
        elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "**************************************"
                echo "Stop number field empty"
        elif [ -n "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "**************************************"
                echo "Multiplier number field empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "**************************************"
                echo "First number field empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "**************************************"
                echo "First number field empty"
                echo "Multiplier number field empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "**************************************"
                echo "First number field empty"
                echo "Stop number field empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "**************************************"
                echo "First number field empty"
                echo "Multiplier number field empty"
                echo "Stop number field empty"
        else
                echo "**************************************"
                echo "Something went wrong"
        fi

elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
then
        ans=$((first*multiplier))
        if [ $ans -le $stop_number ]
        then
                while [ $ans -le $stop_number ]
                do
                        ans=$((first*multiplier))
                        echo "*******************************************"
                        echo "$first times $multiplier  --> $ans"
                        ((multiplier++))
                        sleep 0.5

                done
        elif [ $ans -gt $stop_number ]
        then
                echo "**************************************"
                echo "$first times $multiplier --> $ans"
                echo "$ans greater than or equal to $stop_number"
                echo "Nothing to do"
        else
                echo "Something went wrong"
        fi
fi

-------------------------------------------------------------------------------------------------------------------------------------------------------------
##Basic while loop: User inputs the first number, multiplier, and stop number. 
#The first number is then multiplied by the multiplier until reaching the stop number
#if the result of multiplication i.e. first times $multiplier is greater than stop_number .. nothing to do
#or else do the multiplication until the result is less than stop_number
#with functions --> Chec user input must contain only numeric values
#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the multiplier number"
read multiplier
echo "Enter the stop number"
read stop_number

function first_check {
        [[ "$first" =~ ^[0-9]+$ ]]
}
function multiplier_check {
        [[ "$multiplier" =~ ^[0-9]+$ ]]
}
function stop_number_check {
        [[ "$stop_number" =~ ^[0-9]+$ ]]
}


function first_wrong {
        [[ ! "$first" =~ ^[0-9]+$ ]]
}
function multiplier_wrong {
        [[ ! "$multiplier" =~ ^[0-9]+$ ]]
}
function stop_number_wrong {
        [[ ! "$stop_number" =~ ^[0-9]+$ ]]
}


if [ -z "$first" ] || [ -z "$multiplier" ] || [ -z "$stop_number" ]
then
        if [ -n "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "****************************************"
                echo "Multiplier field is empty"
                echo "Stop number field is empty"
        elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "****************************************"
                echo "Stop number field is empty"
        elif [ -n "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "****************************************"
                echo "Multiplier field is empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "****************************************"
                echo "First number field is empty"
                echo "Multiplier field is empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "****************************************"
                echo "First number field is empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "****************************************"
                echo "First number field is empty"
                echo "Stop number field is empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "****************************************"
                echo "First number field is empty"
                echo "Multiplier field is empty"
                echo "Stop number field is empty"
        else
                echo "****************************************"
                echo "Issues with the user input"
        fi
elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
then
        if first_wrong || multiplier_wrong || stop_number_wrong
        then
                if first_check && multiplier_wrong && stop_number_wrong
                then
                        echo "*******************************************"
                        echo "Multiplier field can only contain numeric digits"
                        echo "Stop number field can only contain numeric digits"
                elif first_check && multiplier_check && stop_number_wrong
                then
                        echo "*******************************************"
                        echo "Stop number field can only contain numeric digits"
                elif first_check && multiplier_wrong && stop_number_check
                then
                        echo "*******************************************"
                        echo "Multiplier field can only contain numeric digits"
                elif first_wrong && multiplier_wrong && stop_number_check
                then
                        echo "*******************************************"
                        echo "First field can only contain numeric digits"
                        echo "Multiplier field can only contain numeric digits"
                elif first_wrong && multiplier_check && stop_number_check
                then
                        echo "*******************************************"
                        echo "First field can only contain numeric digits"
                elif first_wrong && multiplier_check && stop_number_wrong
                then
                        echo "*******************************************"
                        echo "First field can only contain numeric digits"
                        echo "Stop number field can only contain numeric digits"
                elif first_wrong && multiplier_wrong && stop_number_wrong
                then
                        echo "*******************************************"
                        echo "First field can only contain numeric digits"
                        echo "Multiplier field can only contain numeric digits"
                        echo "Stop number field can only contain numeric digits"
                else
                        echo "******************************************"
                        echo "Something went wrong with user input validation"
                fi
        elif first_check && multiplier_check && stop_number_check
        then
                ans=$((first*multiplier))
                if [ $ans -lt $stop_number ]
                then
                        echo "**************************************"
                        while [ $ans -lt $stop_number ]
                        do
                                echo "$first times $multiplier --> $ans"
                                ((multiplier++))
                                ans=$((first*multiplier))
                                sleep 0.5
                        done
                elif [ $ans -eq $stop_number ]
                then
                        echo "***********************************"
                        echo "$first times $multiplier --> $ans"
                        echo "Result is equal to stop number"
                        echo "Nothing to do"
                elif [ $ans -gt $stop_number ]
                then
                        echo "***********************************"
                        echo "$first times $multiplier --> $ans"
                        echo "Result is greater to stop number"
                        echo "Nothing to do"
                else
                        echo "***********************************"
                        echo "Something went wrong with caculation"
                fi
        fi


fi

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the multiplier"
read multiplier
echo "Enter the stop number"
read stop_number

function first_right {
        [[ $first =~ ^[0-9]+$ ]]
}
function first_wrong {
        [[ ! $first =~ ^[0-9]+$ ]]
}
function multiplier_right {
        [[ $multiplier =~ ^[0-9]+$ ]]
}
function multiplier_wrong {
        [[ ! $multiplier =~ ^[0-9]+$ ]]
}
function stop_right {
        [[ $stop_number =~ ^[0-9]+$ ]]
}
function stop_wrong {
        [[ ! $stop_number =~ ^[0-9]+$ ]]
}

if [ -z "$first" ] || [ -z "$multiplier" ] || [ -z "$stop_number" ]
then
        if [ -n "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "*****************************************"
                echo "Stop number field is empty"
        elif [ -n "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "*****************************************"
                echo "Multiplier number field is empty"
                echo "Stop number field is empty"
        elif [ -n "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "*****************************************"
                echo "Multiplier number field is empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "*****************************************"
                echo "First number field is empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "*****************************************"
                echo "First number field is empty"
                echo "Multiplier number field is empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "*****************************************"
                echo "First number field is empty"
                echo "Stop number field is empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "*****************************************"
                echo "First number field is empty"
                echo "Multiplier number field is empty"
                echo "Stop number field is empty"
        else
                echo "*****************************************"
                echo "Issues with the user input"
        fi
elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
then
        if first_wrong || multiplier_wrong || stop_wrong
        then
                if first_right && multiplier_right && stop_wrong
                then
                        echo "**************************************************"
                        echo "Stop number field must contain only numeric digits"
                elif first_right && multiplier_wrong && stop_wrong
                then
                        echo "**************************************************"
                        echo "Multiplier number field must contain only numeric digits"
                        echo "Stop number field must contain only numeric digits"
                elif first_right && multiplier_wrong && stop_right
                then
                        echo "**************************************************"
                        echo "Multiplier number field must contain only numeric digits"
                elif first_wrong && multiplier_right && stop_right
                then
                        echo "**************************************************"
                        echo "First number field must contain only numeric digits"
                elif first_wrong && multiplier_wrong && stop_right
                then
                        echo "**************************************************"
                        echo "First number field must contain only numeric digits"
                        echo "Multiplier number field must contain only numeric digits"
                elif first_wrong && multiplier_right && stop_wrong
                then
                        echo "**************************************************"
                        echo "First number field must contain only numeric digits"
                        echo "Stop number field must contain only numeric digits"
                elif first_wrong && multiplier_wrong && stop_wrong
                then
                        echo "**************************************************"
                        echo "First number field must contain only numeric digits"
                        echo "Multiplier number field must contain only numeric digits"
                        echo "Stop number field must contain only numeric digits"
                else
                        echo "**************************************************"
                        echo "Issues with the user input validation"
                fi
        elif first_right && multiplier_right && stop_right
        then
                ans=$((first*multiplier))
                if [ $ans -lt $stop_number ]
                then
                        while [ $ans -lt $stop_number ]
                        do
                                echo "**********************************************"
                                echo "$first times $multiplier --> $ans"
                                ((multiplier++))
                                ans=$((first*multiplier))
                                sleep 0.5
                        done
                elif [ $ans -eq $stop_number ]
                then
                        echo "**************************************"
                        echo "$first times $multiplier --> $ans"
                        echo "Result i.e. $ans is equal to stop number i.e. $stop_number"
                        echo "Cannot do anything"
                elif [ $ans -gt $stop_number ]
                then
                        echo "**************************************"
                        echo "$first times $multiplier --> $ans"
                        echo "Result i.e. $ans is greater than stop number i.e. $stop_number"
                        echo "Cannot do anything"
                else
                        echo "**************************************"
                        echo "Issues with calculation"
                fi
        fi
fi

-----------------------------------------------------------------------------------------------------------------------------------------------------------
##Basic while loop: User inputs the first number, multiplier, and stop number. 
#The first number is then multiplied by the multiplier until reaching the stop number
#if the result of multiplication i.e. first times $multiplier is greater than stop_number .. nothing to do
#or else do the multiplication until the result is less than stop_number
#with functions --> Chec user input must contain only numeric values
#user input must not be greater than 2 digits

#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the multiplier number"
read multiplier
echo "Enter the stop number"
read stop_number

function first_right {
        [[ $first =~ ^[0-9]+$ ]]
}
function first_wrong {
        [[ ! $first =~ ^[0-9]+$ ]]
}
function multiplier_right {
        [[ $multiplier =~ ^[0-9]+$ ]]
}
function multiplier_wrong {
        [[ ! $multiplier =~ ^[0-9]+$ ]]
}
function stop_number_right {
        [[ $stop_number =~ ^[0-9]+$ ]]
}
function stop_number_wrong {
        [[ ! $stop_number =~ ^[0-9]+$ ]]
}

function first_right_range {
        [[ $first =~ ^[0-9]{1,2}$ ]]
}
function first_wrong_range {
        [[ ! $first =~ ^[0-9]{1,2}$ ]]
}
function multiplier_right_range {
        [[ $multiplier =~ ^[0-9]{1,2}$ ]]
}
function multiplier_wrong_range {
        [[ ! $multiplier =~ ^[0-9]{1,2}+$ ]]
}
function stop_number_right_range {
        [[ $stop_number =~ ^[0-9]{1,2}$ ]]
}
function stop_number_wrong_range {
        [[ ! $stop_number =~ ^[0-9]{1,2}$ ]]
}
if [ -z "$first" ] || [ -z "$multiplier" ] || [ -z "$stop_number" ]
then
        if [ -n "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "************************************"
                echo "Stop number field is empty"
        elif [ -n "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "************************************"
                echo "Multiplier number field is empty"
                echo "Stop number field is empty"
        elif [ -n "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "************************************"
                echo "Multiplier number field is empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "************************************"
                echo "First number field is empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "************************************"
                echo "First number field is empty"
                echo "Multiplier number field is empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "************************************"
                echo "First number field is empty"
                echo "Stop number field is empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "************************************"
                echo "First number field is empty"
                echo "Multiplier number field is empty"
                echo "Stop number field is empty"
        else
                echo "************************************"
                echo "Issues with the user input"
        fi
elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
then
        if first_wrong || multiplier_wrong || stop_number_wrong
        then
                if first_right && multiplier_right && stop_number_wrong
                then
                        echo "********************************************"
                        echo "Stop number field must contain only digits"
                elif first_right && multiplier_wrong && stop_number_wrong
                then
                        echo "********************************************"
                        echo "Multiplier number field must contain only digits"
                        echo "Stop number field must contain only digits"
                elif first_right && multiplier_wrong && stop_number_right
                then
                        echo "********************************************"
                        echo "Multiplier number field must contain only digits"
                elif first_wrong && multiplier_right && stop_number_right
                then
                        echo "********************************************"
                        echo "First number field must contain only digits"
                elif first_wrong && multiplier_wrong && stop_number_right
                then
                        echo "********************************************"
                        echo "First number field must contain only digits"
                        echo "Multiplier number field must contain only digits"
                elif first_wrong && multiplier_right && stop_number_wrong
                then
                        echo "********************************************"
                        echo "First number field must contain only digits"
                        echo "Stop number field must contain only digits"
                elif first_wrong && multiplier_wrong && stop_number_wrong
                then
                        echo "********************************************"
                        echo "First number field must contain only digits"
                        echo "Multiplier number field must contain only digits"
                        echo "Stop number field must contain only digits"
                else
                        echo "********************************************"
                        echo "Issues with the user input validation"
                fi
        elif first_right && multiplier_right && stop_number_right
        then
                if first_right_range && multiplier_right_range && stop_number_wrong_range
                then
                        echo "********************************************"
                        echo "Stop number field cannot contain than 2 digits"
                elif first_right_range && multiplier_wrong_range && stop_number_wrong_range
                then
                        echo "********************************************"
                        echo "Multiplier number field cannot contain than 2 digits"
                        echo "Stop number field cannot contain than 2 digits"
                elif first_right_range && multiplier_wrong_range && stop_number_right_range
                then
                        echo "********************************************"
                        echo "Multiplier number field cannot contain than 2 digits"
                elif first_wrong_range && multiplier_right_range && stop_number_right_range
                then
                        echo "********************************************"
                        echo "First number field cannot contain than 2 digits"
                elif first_wrong_range && multiplier_wrong_range && stop_number_right_range
                then
                        echo "********************************************"
                        echo "First number field cannot contain than 2 digits"
                        echo "Multiplier number field cannot contain than 2 digits"
                elif first_wrong_range && multiplier_right_range && stop_number_wrong_range
                then
                        echo "********************************************"
                        echo "First number field cannot contain than 2 digits"
                        echo "Stop number field cannot contain than 2 digits"
                elif first_wrong_range && multiplier_wrong_range && stop_number_wrong_range
                then
                        echo "********************************************"
                        echo "First number field cannot contain than 2 digits"
                        echo "Multiplier number field cannot contain than 2 digits"
                        echo "Stop number field cannot contain than 2 digits"
                elif first_right_range && multiplier_right_range && stop_number_right_range
                then
                        ans=$(($first*$multiplier))
                        if [ $ans -lt $stop_number ]
                        then
                                while [ $ans -lt $stop_number ]
                                do
                                        echo "**********************************************"
                                        echo "$first times $multiplier -->$ans"
                                        ((multiplier++))
                                        ans=$(($first*$multiplier))
                                        sleep 0.5
                                done
                        elif [ $ans -eq $stop_number ]
                        then
                                echo "*******************************************"
                                echo "$first times $multiplier --> $ans"
                                echo "Stop number --> $stop_number"
                                echo "Both are equal, nothing to do"
                        elif [ $ans -gt $stop_number ]
                        then
                                echo "*******************************************"
                                echo "$first times $multiplier --> $ans"
                                echo "Stop number --> $stop_number"
                                echo "Result i.e. $ans is greater than $stop_number"
                                echo "Nothing to do"
                        fi
                fi

        fi
fi
----------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the multiplier number"
read multiplier
echo "Enter the stop number"
read stop_number

function lines {
        echo "************************************"
}
function first_right {
        [[ $first =~ ^[0-9]+$ ]]
}
function first_wrong {
        [[ ! $first =~ ^[0-9]+$ ]]
}
function multiplier_right {
        [[ $multiplier =~ ^[0-9]+$ ]]
}
function multiplier_wrong {
        [[ ! $multiplier =~ ^[0-9]+$ ]]
}
function stop_number_right {
        [[ $stop_number =~ ^[0-9]+$ ]]
}
function stop_number_wrong {
        [[ ! $stop_number =~ ^[0-9]+$ ]]
}

if [ -z "$first" ] || [ -z "$multiplier" ] || [ -z "$stop_number" ]
then
        if [ -n "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                lines
                echo "Multiplier number field is empty"
                echo "Stop number field is empty"
        elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                lines
                echo "Stop number field is empty"
        elif [ -n "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                lines
                echo "Multiplier number field is empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                lines
                echo "First number field is empty"
                echo "Multiplier number field is empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
        then
                lines
                echo "First number field is empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                lines
                echo "First number field is empty"
                echo "Multiplier number field is empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                lines
                echo "First number field is empty"
                echo "Multiplier number field is empty"
                echo "Stop number field is empty"
        else
                lines
                echo "Issues with the user input"
        fi
elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
then
        if first_wrong || multiplier_wrong || stop_number_wrong
        then
                if first_right && multiplier_wrong && stop_number_wrong
                then
                        lines
                        echo "Multiplier number field must contain only nuemric values"
                        echo "Stop number field must contain only nuemric values"
                elif first_right && multiplier_right && stop_number_wrong
                then
                        lines
                        echo "Stop number field must contain only nuemric values"
                elif first_right && multiplier_wrong && stop_number_right
                then
                        lines
                        echo "Multiplier number field must contain only nuemric values"
                elif first_wrong && multiplier_wrong && stop_number_right
                then
                        lines
                        echo "First number field must contain only nuemric values"
                        echo "Multiplier number field must contain only nuemric values"
                elif first_wrong && multiplier_right && stop_number_right
                then
                        lines
                        echo "First number field must contain only nuemric values"
                elif first_wrong && multiplier_right && stop_number_wrong
                then
                        lines
                        echo "First number field must contain only nuemric values"
                        echo "Stop number field must contain only nuemric values"
                elif first_wrong && multiplier_wrong && stop_number_wrong
                then
                        lines
                        echo "First number field must contain only nuemric values"
                        echo "Multiplier number field must contain only nuemric values"
                        echo "Stop number field must contain only nuemric values"
                else
                        lines
                        echo "Issues with user input validation"
                fi
        elif first_right && multiplier_right && stop_number_right
        then
                ans=$(($first*$multiplier))
                if [ $ans -lt $stop_number ]
                then
                        while [ $ans -lt $stop_number ]
                        do
                                lines
                                echo "$first times $multiplier --> $ans"
                                ans=$(($first*$multiplier))
                                ((multiplier++))
                                sleep 0.5

                        done
                elif [ $ans -eq $stop_number ]
                then
                        lines
                        echo "$first times $multiplier --> $ans"
                        echo "stop number is equal to $ans"
                        echo "Cannot do anything"
                elif [ $ans -gt $stop_number ]
                then
                        lines
                        echo "$first times $multiplier --> $ans"
                        echo "stop number is less than $ans"
                        echo "Cannot do anything"
                fi
        fi
fi

