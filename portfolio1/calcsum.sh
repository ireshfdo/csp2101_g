#!/bin/bash
#Name - Iresh Kariyakarawanage   Student Number - 10494634

let result=$1+$2+$3 # assign the sum of the integers to the variable result

if [ $result -le 30 ]; then # checks if the sum of the integers is less than or equal to 30
    echo "The sum of $1 and $2 and $3 is $result"
else # otherwise exit the script with error code 1
    echo "Sum exceeds maximum allowable"     
    exit 1
fi    
exit 0