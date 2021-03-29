#!/bin/bash
#Name - Iresh Kariyakarawanage    Student Number - 10494634

while true; do # begin loop
     read -p "Enter a two digit numeric code:" var # prompt user to enter a two digit numeric code
     if [[ "$var" =~ ^[a-zA-Z0-9]+$ ]] && [[ ! "$var" =~ ^[0-9]+$ ]] || [[ $var -ne 20 ]] && [[ $var -ne 40 ]]; then #if the input is invalid
          echo "Invalid input, please try again"
     else
          break # if the input is valid, exit the loop
     fi
done

echo "Thank you, $var is a valid input" # echo the input number to terminal

exit 0
               
