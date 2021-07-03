#!/bin/sh

echo -en "Please guess the magix number: "

read X

echo $X | grep "[^0-9]" > /dev/null 2>&1
if [ "$?" -eq "0" ]; then 
  # If grep found something other than 0-9
  echo "Sorry, number wanted"
else 
  # Is a number between 0-9
  if [ "$X" -eq "7" ]; then
    echo "You entered the magic number"
  fi
fi
