#!/bin/bash
#Example for global and local variable
#Global variable can be used within as well as outside the function
#local variable is cerated within the function with the local keyword and can be used within the function only 

#variable created 
number=10

#function created and within function a variable is created
# Now the variable name within the function is same as the previous, so it will be a gloabl variable 
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


