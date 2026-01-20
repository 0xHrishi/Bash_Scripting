#!/bin/bash
# --------------------------------------------
# Basic Bash Script Demonstration -- Shows variables, command substitution, and system information fetching.
# --------------------------------------------

#variable
a=10
tv_show="Harry Potter"
echo "Number is $a"
tv_show="Harry Potter"

# Store current date and time using command substitution
current=$(date)
echo "Current date and time is $current"

# Print the current working directory
echo "Current working directory -- $(pwd)"

# Print the current user's UID using id command
echo "Current login user UID number -- $(id -u)"

# Print the shell name
echo "Current login user UID number and name -- $UID -- $USERNAME"
