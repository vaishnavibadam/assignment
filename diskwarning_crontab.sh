#!/bin/bash
# assigning diskusage value
var=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
# checking if mail id as an argument
if ! [[ "$2" == " " ]]
then
  mail=$2
#check if mailid is not given
else
  mail=vittu512@gmail.com
fi
#sending mail 
if [ $var -gt $1 ]
then
  echo "WARNING! Your disk space is:" $var"%  
  Delete some unused files" | mail -s "Memory Usage Alert" $mail 

fi

