#!/bin/bash
# Calculates attendance percentage based on total classes held and attended, then decides exam eligibility.
function lines {
        echo "****************************************************************"
}

# color codes for error messages
red='\033[0;31m'
nf='\033[0m'

# function to make sure that the user input must contain only numeric values
function total_class_check {
        [[ $total_class =~ ^[1-9][0-9]*$ ]]
}
function attend_class_check {
        [[ $attend_class =~ ^[1-9][0-9]*$ ]]
}

# Prompt user input
read -p "Enter the total number of classes held: " total_class
read -p "Enter the number of classes attended: " attend_class

# user input empty
if [ -z "$total_class" ] || [ -z "$attend_class" ]
then
        lines
        if [ -z "$total_class" ]
        then
                echo -e "${red}User input --> Total number of classes held field is empty${nf}"
        fi
        if [ -z "$attend_class" ]
        then
                echo -e "${red}User input --> Total number of classes attended field is empty${nf}"
        fi

# user input not empty
# validation check -- user input must contain only numeric values
# Calculate attendance percentage
elif [ -n "$total_class" ] && [ -n "$attend_class" ]
then
        if ! total_class_check || ! attend_class_check
        then
                lines
                if ! total_class_check
                then
                        echo -e "${red}Total number of classes held field must contain only numeric values${nf}"
                fi
                if ! attend_class_check
                then
                        echo -e "${red}Total number of classes attended field must contain only numeric values${nf}"
                fi
        elif total_class_check && attend_class_check
        then
                lines
                attendance_percentage=$(($attend_class*100/$total_class))
                if [ $attendance_percentage -ge 75 ]
                then
                        echo "Total number of classes held $total_class"
                        echo "Total number of classes attended $attend_class"
                        echo "Attendance percentage --> $attendance_percentage"
                        echo "You are eligible for writing exam"
                elif [ $attendance_percentage -ge 65 ] && [ $attendance_percentage -le 74 ]
                then
                        echo "Total number of classes held $total_class"
                        echo "Total number of classes attended $attend_class"
                        echo "Attendance percentage --> $attendance_percentage"
                        echo "Attendance is low, can be improved"
                elif [ $attendance_percentage -le 64 ]
                then
                        echo "Total number of classes held $total_class"
                        echo "Total number of classes attended $attend_class"
                        echo "Attendance percentage --> $attendance_percentage"
                        echo "Contact principal"
                fi
        fi
fi
