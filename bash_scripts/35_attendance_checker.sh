#!/bin/bash
# This Bash script calculates a student's attendance percentage
# based on user input for total classes and classes attended.
function lines {
        echo "********************************************************"
}
# color codes for error messages
RED='\033[1;31m'
NF='\033[0m'
# function to check user input i.e. only accept integer values
function total_classes_check {
        [[ $total_classes =~ ^[1-9][0-9]*$ ]]
}
function attended_classes_check {
        [[ $attended_classes =~ ^[1-9][0-9]*$ ]]
}
# prompt for user input
read -p "Enter the total number of classes: " total_classes
read -p "Enter the total number of classes attended: " attended_classes

# user input empty
if [ -z "$total_classes" ] || [ -z "$attended_classes" ]
then
        lines
        if [ -z "$total_classes" ]
        then
                echo -e "${RED}User input --> Total number of classes field is empty${NF}"
        fi
        if [ -z "$attended_classes" ]
        then
                echo -e "${RED}User input --> Total number of classes attended field is empty${NF}"
        fi
# user input not empty
# validation check i.e. must accept only integer values
# after calculation, display the attendance percentage
else
        lines
        if ! total_classes_check || ! attended_classes_check
        then
                if ! total_classes_check
                then
                        echo -e "${RED}Total number of classes field must contain only numeric values${NF}"
                fi
                if ! attended_classes_check
                then
                        echo -e "${RED}Total number of classes attended field must contain only numeric values${NF}"
                fi
        else
                if [ $total_classes -lt $attended_classes ]
                then
                        echo -e "${RED}Total number of classes cannot be lesser than number of classes attended ${NF}"
                else
                        attendance=$(($attended_classes * 100 / $total_classes))

                        echo "Total number of classes --> $total_classes"
                        echo "Total number of classes attended --> $attended_classes"
                        if [ $attendance -ge 75 ]
                        then
                                echo "Attendance percentage --> $attendance"
                        elif [ $attendance -ge 60 ] && [ $attendance -le 74 ]
                        then
                                echo "Attendance percentage --> $attendance"
                                echo -e "${RED}CAREFUL${NF}"
                        else
                                echo -e "${RED}CONTACT PRINCIPAL${NF}"
                        fi
                fi
        fi
fi
--------------------------------------------------------------------------------------------------------
ADVANCED VERSION


function lines {
        echo "********************************************************"
}

RED='\033[1;31m'
NF='\033[0m'
function total_classes_check {
        [[ $total_classes =~ ^[1-9][0-9]*$ ]]
}
function attended_classes_check {
        [[ $attended_classes =~ ^[1-9][0-9]*$ ]]
}
read -p "Enter the total number of classes: " total_classes
read -p "Enter the total number of classes attended: " attended_classes


if [ -z "$total_classes" ] || [ -z "$attended_classes" ]
then
        lines
        if [ -z "$total_classes" ]
        then
                echo -e "${RED}User input --> Total number of classes field is empty${NF}"
        fi
        if [ -z "$attended_classes" ]
        then
                echo -e "${RED}User input --> Total number of classes attended field is empty${NF}"
        fi

else
        lines
        if ! total_classes_check || ! attended_classes_check
        then
                if ! total_classes_check
                then
                        echo -e "${RED}Total number of classes field must contain only numeric values${NF}"
                fi
                if ! attended_classes_check
                then
                        echo -e "${RED}Total number of classes attended field must contain only numeric values${NF}"
                fi
        else
                if [ $total_classes -lt $attended_classes ]
                then
                        echo -e "${RED}Total number of classes cannot be lesser than number of classes attended ${NF}"
                else
                        attendance=$(bc <<< "scale=2; $attended_classes * 100 / $total_classes")

                        echo "Total number of classes --> $total_classes"
                        echo "Total number of classes attended --> $attended_classes"
                        if (( $(bc <<< "$attendance >= 75") ))
                        then
                                echo "Attendance percentage --> $attendance"
                        elif (( $(bc <<< "$attendance >= 60") )) && (( $(bc <<< "$attendance <= 74") ))
                        then
                                echo "Attendance percentage --> $attendance"
                                echo -e "${RED}CAREFUL${NF}"
                        else
                                echo -e "${RED}CONTACT PRINCIPAL${NF}"
                        fi
                fi
        fi
fi
