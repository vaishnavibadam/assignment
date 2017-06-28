#!/bin/bash
#checking for atleast 2 argument
if [ $# -lt 2 ]    
then
	echo "usage:<$0> <hourly/daily/weekly/monthly/yearly> <threshold> [email]"
fi
#to make case insensitive
shopt -s nocasematch   
#validating 1st argument
if ! [[ "$1" == "hourly" || "daily" || "weekly" || "monthly" || "yearly"  ]]  
then
	echo "usage:<$0> <hourly/daily/weekly/monthly/yearly> <threshold> [email]"
fi
#checking if 1st argument is hourly 
if [[ "$1" == "hourly" ]]   
then
	schedule="41 * * * *"
fi
#checking if 1st argument is daily
if [[ "$1" == "daily" ]]
then
	schedule="52 15 * * *"
fi
#checking if 1st argument is weekly
if [[ "$1" == "weekly" ]]
then
	schedule="45 15 * * 1"
fi
#checking if 1st argument is monthly
if [[ "$1" == "monthly" ]]
then
	schedule="45 15 1 * *"
fi
#checking if 1st argument is yearly
if [[ "$1" == "yearly" ]]
then
	schedule="45 15 1 1 *"
fi
#setting cronjob
echo "$schedule bash /home/rihu/assignment/diskwarning_crontab.sh $2 $3" | crontab -

 
