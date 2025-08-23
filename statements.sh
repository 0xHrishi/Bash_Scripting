#statements 

#if statment to check whether the condition is true, if true the code will get executed 

if [ condition ]
then
    <code>
fi 

#if else statement --> If the condition is true than execute the code else go to the else statment and execute the code 

if [ condition ]
then
    <code>
else
    <code>
fi 

#if elif else statements to check multiple conditions 

if [ condition ]
then
    <code> 
elif [ condition ]
then
    <code> 
elif [ condition ]
then
    <code> 
else
    <code> 
fi


#nested statments 
if [ condition ]
then
      if [ condition ]
      then
           <code> 
      else
            <code>
      fi
elif [ condition ]
then
      <code> 
else 
      <code> 
fi 


