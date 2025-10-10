#!/bin/bash
#Example of global variable
#Global variable can be used within as well as outside the function

#variable created 
number=10

#function created and a variable which is global
function numbers {
        number=20
        echo "Number within the function --> $number"
}

echo "Number before the function called --> $number"
numbers
echo "Number after the function called --> $number"

#Output
#Number before the function called --> 10
#Number within the function --> 20
#Number after the function called --> 20

echo "*********************************************************************************"
sleep 2

#Local variable concept 
#Variable created
num=10

#local variable created withhin the function with local keyword
function nums {
        local num=20
        echo "Number wihtin the function --> $num"
}

echo "Number before the function called --> $num"
nums
echo "Number after the function called --> $num"

#output
#Number before the function called --> 10
#Number wihtin the function --> 20
#Number after the function called --> 10


