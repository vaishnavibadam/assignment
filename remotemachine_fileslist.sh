#!/bin/bash

if [[ $# -le 1 ]];
then              #checking whether input has 2 arguments 
	echo "usage:$0 <username> <ip address> ['command'] [location]"
	exit 1
fi 
if ! [[ $2 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then  #validating ip address
	echo "usage:$0 <username> <ip address>"
	exit
fi
#ssh $1@$2 ls -R|xargs -n 1 basename   #connecting to remote system and listing files
if [ $# -gt 2 ]
then
ssh $1@$2 $3 $4 $5
else
ssh $1@$2 ls -R|xargs -n 1 basename
fi
