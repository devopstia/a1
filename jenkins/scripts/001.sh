#!/bin/bash

# Prompt the user for input
read -p "Enter username: " username
read -s -p "Enter password: " password
echo  # Add a newline after the password input
read -p "Enter email: " email
read -p "Enter first name: " firstname
read -p "Enter last name: " lastname

# Display the collected information
echo "Username: $username"
echo "Password: $email"
echo "Email: $email"
echo "First Name: $firstname"
echo "Last Name: $lastname"

# You can perform further actions with the collected information here
