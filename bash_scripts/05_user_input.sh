#!/bin/bash

# Prompt the user for their full name
echo "Enter your full name"
# Stores the entered name in the variable 'full_name'
read full_name

# Prompt the user for their age
echo "Enter your age"
# Stores the entered age in the variable 'age'
read age

# Display the collected information
echo "Your full name --> $full_name and age is $age"

# With read command 
read -p "Enter the username: " username
read -sp "Enter the password: " password
echo "Username is $username and password is $password"
