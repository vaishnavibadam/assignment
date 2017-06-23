#! /bin/bash
if [[ $# -ne 2 ]];
then              #checking whether input has 2 arguments 
	echo "usage:$0 <file type> <pattern>"
	exit 1
fi 
find *.$1|xargs grep $2
