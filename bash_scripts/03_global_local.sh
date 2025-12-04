#!/bin/bash

# -------------------------------------------------------
# Demonstrates how global variables behave inside functions in Bash. 
# Variables are global by default unless 'local' keyword is used.
# -------------------------------------------------------

number=10

function global_example {
        number=20
        echo "Number value, within the function -- $number"
}

# Display variable before function call
echo "Before the function called, value of the number -- $number"
# Call the function
global_example
# Display variable after function call
echo "After the function, value of the number -- $number"

# Output 
# Before the function called, value of the number -- 10
# Number value, within the function -- 20
# After the function, value of the number -- 20

-------------------------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash
# -------------------------------------------------------------------
# Description: Demonstrates the difference between global and local variables inside a Bash function.
# -------------------------------------------------------------------

# Global variable
number=10

# Function that declares a local variable with the same name
function global_example {
        local number=20
        echo "Number value, within the function -- $number"
}

# Display variable before function call
echo "Before the function called, value of the number -- $number"
# Call the function
global_example
# Display variable after function call
# The global value remains unchanged because 'local' was used inside the function
echo "After the function, value of the number -- $number"

# Output 
# Before the function called, value of the number -- 10
# Number value, within the function -- 20
# After the function, value of the number -- 10
