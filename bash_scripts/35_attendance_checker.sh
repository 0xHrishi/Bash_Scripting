#!/bin/bash
# Purpose   : Validates user input for total classes and attended classes, calculates attendance percentage, and prints eligibility status.
function lines {
        echo "*************************************************************"

}

# Function total_class_check, attend_class_check 
# Make sure the user input contain only numeric values and the number should not start with zero
function total_class_check {
        [[ $total_class =~ ^[1-9][0-9]*$ ]]
}
function attend_class_check {
        [[ $attend_class =~ ^[1-9][0-9]*$ ]]
}

# Prompt for user input
read -p "Enter the total number of classes: " total_class
read -p "Enter the number of classes attended: " attend_class

# User input empty
if [ -z "$total_class" ] || [ -z "$attend_class" ]
then
        if [ -n "$total_class" ] && [ -z "$attend_class" ]
        then
                lines
                echo "User input --> Number of class attended field empty"
        elif [ -z "$total_class" ] && [ -n "$attend_class" ]
        then
                lines
                echo "User input --> Total number of classes field empty"
        elif [ -z "$total_class" ] && [ -z "$attend_class" ]
        then
                lines
                echo "User input --> Total number of classes field empty"
                echo "User input --> Number of class attended field empty"
        fi

# User input not empty
# Validation check i.e. User input must contain only numeric values and not starting with zero
# Calulate attendance in percentage based upon the user input

elif [ -n "$total_class" ] && [ -n "$attend_class" ]
then
        if ! total_class_check || ! attend_class_check
        then
                if total_class_check && ! attend_class_check
                then
                        lines
                        echo "Number of classes attended field must contain only numeric values"
                elif ! total_class_check && attend_class_check
                then
                        lines
                        echo "Total number of classes field must contain only numeric values"
                elif ! total_class_check && ! attend_class_check
                then
                        lines
                        echo "Total number of classes field must contain only numeric values"
                        echo "Number of classes attended field must contain only numeric values"
                fi

        elif total_class_check && attend_class_check
        then
                attendance_checker=$(($attend_class * 100 / $total_class))
                if [ $attendance_checker -ge 75 ]
                then
                        lines
                        echo "Total number of classes --> $total_class"
                        echo "Number of classes attend --> $attend_class"
                        echo "Attendance checker --> $attendance_checker"
                        echo "You are eligible for writing exam"
                elif [ $attendance_checker -le 74 ] && [ $attendance_checker -ge 60 ]
                then
                        lines
                        echo "Total number of classes --> $total_class"
                        echo "Number of classes attend --> $attend_class"
                        echo "Attendance checker --> $attendance_checker"
                        echo "Attendace too low, but can be improved"
                elif [ $attendance_checker -le 59 ]
                then
                        lines
                        echo "Total number of classes --> $total_class"
                        echo "Number of classes attend --> $attend_class"
                        echo "Attendance checker --> $attendance_checker"
                        echo "CONTACT PRINCIPAL"
                fi
        fi
fi
