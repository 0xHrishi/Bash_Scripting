#!/bin/bash
# --------------------------------------------
# Basic Bash Script Demonstration -- Shows variables, command substitution, and system information fetching.
# --------------------------------------------

# Integer variable
a=10
echo "Number is $a"

# String variable
tv_show="Harry Potter"
echo "Favourite television show -- $tv_show"

# Store current date and time using command substitution
current=$(date)
echo "Current date and time is $current"

# Print the current working directory
echo "Current working directory -- $(pwd)"

# Print the current user's UID using id command
echo "Current login user UID number -- $(id -u)"

# Print the shell name
echo "Current login user UID number -- $0 and $SHELL"
