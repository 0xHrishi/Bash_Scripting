#accept two numbers from the user input
#add the two numbers, the script will check whether the result i.e. addition is odd or even number

#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the second number"
read second

if [ -z "$first" ] || [ -z "$second" ]
then
        if [ -n "$first" ] && [ -z "$second" ]
        then
                echo "*********************************"
                echo "Second number field is empty"
        elif [ -z "$first" ] && [ -n "$second" ]
        then
                echo "*********************************"
                echo "First number field is empty"
        elif [ -z "$first" ] && [ -z "$second" ]
        then
                echo "*********************************"
                echo "First number field is empty"
                echo "Second number field is empty"
        else
                echo "*********************************"
                echo "Issues with the user input"
        fi
elif [ -n "$first" ] && [ -n "$second" ]
then
        echo "*************************************"
        echo "First number is --> $first"
        echo "Second number is --> $second"
        ans=$((first+second))
        if (($ans%2==0))
        then
                echo "*************************************"
                echo "$first + $second is --> $ans"
                echo "$ans is a even number"
        elif (($ans%2!=0))
        then
                echo "*************************************"
                echo "$first + $second is --> $ans"
                echo "$ans is a odd number"
        else
                echo "*************************************"
                echo "Something went wrong with calculation"
        fi
fi

------------------------------------------------------------------------------------------------------------------------------------------------
#accept two numbers from the user input
#add the two numbers, the script will check whether the result i.e. addition is odd or even number
#user input checking --> Must be numeric digits no alphabets

#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the second number"
read second
if [ -z "$first" ] || [ -z "$second" ]
then
        if [ -n "$first" ] && [ -z "$second" ]
        then
                echo "***************************************"
                echo "Second number field is empty"
        elif [ -z "$first" ] && [ -n "$second" ]
        then
                echo "***************************************"
                echo "First number field is empty"
        elif [ -z "$first" ] && [ -z "$second" ]
        then
                echo "***************************************"
                echo "First number field is empty"
                echo "Second number field is empty"
        else
                echo "***************************************"
                echo "Issues with the user input"
        fi
elif [ -n "$first" ] && [ -n "$second" ]
then
        if [[ "$first" =~ [a-zA-Z] ]] || [[ "$second" =~ [a-zA-Z] ]]
        then
                if [[ "$first" =~ [a-zA-Z] ]] || [[ ! "$second" =~ [a-zA-Z] ]]
                then
                        echo "***************************************"
                        echo "First field cannot contain alphabets"
                elif [[ ! "$first" =~ [a-zA-Z] ]] || [[ "$second" =~ [a-zA-Z] ]]
                then
                        echo "***************************************"
                        echo "Second field cannot contain alphabets"
                elif [[ "$first" =~ [a-zA-Z] ]] || [[ "$second" =~ [a-zA-Z] ]]
                then
                        echo "***************************************"
                        echo "First field cannot contain alphabets"
                        echo "Second field cannot contain alphabets"
                fi
        elif [[ "$first" =~ ^[0-9]+$ ]] && [[ "$second" =~ ^[0-9]+$ ]]
        then
                ans=$((first+second))
                if (($ans%2==0))
                then
                        echo "****************************************"
                        echo "$first plus $second --> $ans"
                        echo "$ans is even number"
                elif (($ans%2!=0))
                then
                        echo "****************************************"
                        echo "$first plus $second --> $ans"
                        echo "$ans is odd number"
                else
                        echo "****************************************"
                        echo "Something went wrong with caculation"
                fi
        fi
fi

------------------------------------------------------------------------------------------------------------------------------------------------
#accept two numbers from the user input
#add the two numbers, the script will check whether the result i.e. addition is odd or even number
#user input checking --> Must be numeric digits no alphabets
#with functions and negative numbers as user input accepted

#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the second number"
read second

function first_right {
        [[ "$first" =~ ^[0-9-]+$ ]]
}
function first_wrong {
        [[ ! "$first" =~ ^[0-9-]+$ ]]
}
function second_right {
        [[ "$second" =~ ^[0-9-]+$ ]]
}
function second_wrong {
        [[ ! "$second" =~ ^[0-9-]+$ ]]
}

if [ -z "$first" ] || [ -z "$second" ]
then
        if [ -n "$first" ] && [ -z "$second" ]
        then
                echo "**************************************"
                echo "Second number field is empty"
        elif [ -z "$first" ] && [ -n "$second" ]
        then
                echo "**************************************"
                echo "First number field is empty"
        elif [ -z "$first" ] && [ -z "$second" ]
        then
                echo "**************************************"
                echo "First number field is empty"
                echo "Second number field is empty"
        else
                echo "**************************************"
                echo "Issues with the use input"
        fi
elif [ -n "$first" ] && [ -n "$second" ]
then
        if first_wrong || second_wrong
        then
                if first_right && second_wrong
                then
                        echo "**************************************"
                        echo "Second number field must contain digits only"
                elif first_wrong && second_right
                then
                        echo "**************************************"
                        echo "First number field must contain digits only"
                elif first_wrong && second_wrong
                then
                        echo "**************************************"
                        echo "First number field must contain digits only"
                        echo "Second number field must contain digits only"
                else
                        echo "**************************************"
                        echo "Something went wrong with user input validation"
                fi
        elif first_right && second_right
        then
                ans=$(($first+$second))
                if (($ans%2==0))
                then
                        echo "*********************************"
                        echo "$first plus $second --> $ans"
                        echo "$ans --> Even number"
                elif (($ans%2!=0))
                then
                        echo "*********************************"
                        echo "$first plus $second --> $ans"
                        echo "$ans --> Odd number"
                else
                        echo "**********************************************"
                        echo "Something went wrong with calculation"
                fi

        fi
fi


--------------------------------------------------------------------------------------------------------------------------------------------------
#accept two numbers from the user input
#add the two numbers, the script will check whether the result i.e. addition is odd or even number
#user input checking --> Must be numeric digits no alphabets
#with functions and negative numbers as user input accepted
#user input must not be greater than 3 digits

#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the second number"
read second

function first_right {
        [[ $first =~ ^[0-9-]+$ ]]
}
function first_wrong {
        [[ ! $first =~ ^[0-9-]+$ ]]
}
function first_range_right {
        [[ $first =~ ^[0-9-]{1,4}$ ]]
}
function first_range_wrong {
        [[ ! $first =~ ^[0-9-]{1,4}$ ]]
}
function second_right {
        [[ $second =~ ^[0-9-]+$ ]]
}
function second_wrong {
        [[ ! $second =~ ^[0-9-]+$ ]]
}
function second_range_right {
        [[ $second =~ ^[0-9-]{1,4}$ ]]
}
function second_range_wrong {
        [[ ! $second =~ ^[0-9-]{1,4}$ ]]
}


if [ -z "$first" ] || [ -z "$second" ]
then
        if [ -n "$first" ] && [ -z "$second" ]
        then
                echo "****************************************"
                echo "Second number field is empty"
        elif [ -z "$first" ] && [ -n "$second" ]
        then
                echo "****************************************"
                echo "First number field is empty"
        elif [ -z "$first" ] && [ -z "$second" ]
        then
                echo "****************************************"
                echo "First number field is empty"
                echo "Second number field is empty"
        else
                echo "****************************************"
                echo "Issues with the user input"
        fi
elif [ -n "$first" ] && [ -n "$second" ]
then
        if first_wrong || second_wrong
        then
                if first_right && second_wrong
                then
                        echo "****************************************"
                        echo "Second field must contain only digits"
                elif first_wrong && second_right
                then
                        echo "****************************************"
                        echo "First field must contain only digits"
                elif first_wrong && second_wrong
                then
                        echo "****************************************"
                        echo "First field must contain only digits"
                        echo "Second field must contain only digits"
                else
                        echo "****************************************"
                        echo "Issues with the user input validation"
                fi
        elif first_right && second_right
        then
                if first_range_wrong || second_range_wrong
                then
                        if first_range_right && second_range_wrong
                        then
                                echo "****************************************"
                                echo "Second number field must contain max 3 digits"
                        elif first_range_wrong && second_range_right
                        then
                                echo "****************************************"
                                echo "First number field must contain max 3 digits"
                        elif first_range_wrong && second_range_wrong
                        then
                                echo "****************************************"
                                echo "First number field must contain max 3 digits"
                                echo "Second number field must contain max 3 digits"
                        else
                                echo "****************************************"
                                echo "Something went wrong while checking user input range"
                        fi
                elif first_range_right && second_range_right
                then
                        ans=$(($first+$second))
                        if (($ans%2==0))
                        then
                                echo "**********************************************"
                                echo "$first plus $second is --> $ans"
                                echo "$ans is --> Even number"
                        elif (($ans%2!=0))
                        then
                                echo "**********************************************"
                                echo "$first plus $second is --> $ans"
                                echo "$ans is --> Odd number"
                        else
                                echo "**********************************************"
                                echo "Something went wrong while additon"
                        fi
                fi
        fi
fi
-------------------------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the second number"
read second


function lines {
        echo "**********************************"
}

function first_right {
        [[ $first =~ ^[0-9-]+$ ]]
}
function first_wrong {
        [[ ! $first =~ ^[0-9-]+$ ]]
}
function second_right {
        [[ $second =~ ^[0-9-]+$ ]]
}
function second_wrong {
        [[ ! $second =~ ^[0-9-]+$ ]]
}

if [ -z "$first" ] || [ -z "$second" ]
then
        if [ -n "$first" ] && [ -z "$second" ]
        then
                lines
                echo "Second number field is empty"
        elif [ -z "$first" ] && [ -n "$second" ]
        then
                lines
                echo "First number field is empty"
        elif [ -z "$first" ] && [ -z "$second" ]
        then
                lines
                echo "First number field is empty"
                echo "Second number field is empty"
        else
                lines
                echo "Issues with the user input"
        fi
elif [ -n "$first" ] && [ -n "$second" ]
then
        if first_wrong || second_wrong
        then
                if first_right && second_wrong
                then
                        lines
                        echo "Second number field can only contain numeric values"
                elif first_wrong && second_right
                then
                        lines
                        echo "First number field can only contain numeric values"
                elif first_wrong && second_wrong
                then
                        lines
                        echo "First number field can only contain numeric values"
                        echo "Second number field can only contain numeric values"
                else
                        lines
                        echo "Issues with the user input validation"
                fi
        elif first_right && second_right
        then
                ans=$(($first+$second))
                if (($ans%2==0))
                then
                        lines
                        echo "First number is --> $first"
                        echo "Second number is --> $second"
                        echo "$first plus $second --> $ans is even number"
                elif (($ans%2!=0))
                then
                        lines
                        echo "First number is --> $first"
                        echo "Second number is --> $second"
                        echo "$first plus $second --> $ans is odd number"
                else
                        lines
                        echo "Something went wrong while calculation"
                fi
        fi
fi







