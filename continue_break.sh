#continue and break statement 
#!/bin/bash

#continue, if the number is 6, it does not execute the rest and goes top of the loop for execution
number=6

for numbers in $(seq 1 10)
do
        if [ $numbers -eq 6 ]
        then
                continue
        else
                echo "$numbers"
        fi
done


echo "****************************************************************"

#break statement --> if the number 6 is found, it stop executing the rest of the code and exit. 
number=6

for numbers in $(seq 1 10)
do
        if [ $numbers -eq 6 ]
        then
                echo "$number is found"
                break
        else
                echo "$numbers"
        fi
done

