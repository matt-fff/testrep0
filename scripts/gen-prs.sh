#!/bin/bash

if ! command -v gh >/dev/null 2>&1; then
    echo "Install gh first"
    exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
    echo "You need to login: gh auth login"
    exit 1
fi


# Check if a command-line argument was provided
if [ $# -eq 0 ]
then
  # If no argument was provided, set the default value of X to 1
  X=1
else
  # If an argument was provided, set the value of X to the argument
  X=$1
fi

# Use a for loop to call the script X times
for ((i=1; i<=X; i++))
do
  # Call the script
  ./gen-pr.sh
done
