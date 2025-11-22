#!/bin/bash
#Variables allows to store data temporaily

#Variable created i.e. first_number
#with the help of echo command, displayed the value for variable by using $ symbol
first_number=10
echo $first_number
echo "*****************************************************************"

#variable full_name which stores user full name 
#In bash scripting, there is no data type concept, so the values are stored as string by default 
full_name="Hrishi Dilip Ghosalkar"
echo $full_name
echo "*****************************************************************"

#command substitution
#Assign output of a command as a value to the variable
date_output=$(date)
echo $date_output
echo "*****************************************************************"

#File output to a variable as value 
file_output=$(cat /etc/resolv.conf | head -n 1)
echo $file_output
echo "*****************************************************************"

#system defined variable i.e. $USER which displays the current login user
echo "Hello $USER, todays date and time is: $(date)"
echo "*****************************************************************"

